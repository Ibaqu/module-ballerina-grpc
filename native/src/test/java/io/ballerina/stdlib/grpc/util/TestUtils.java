package io.ballerina.stdlib.grpc.util;

import io.ballerina.runtime.api.creators.ErrorCreator;
import io.ballerina.runtime.api.creators.TypeCreator;
import io.ballerina.runtime.api.types.Field;
import io.ballerina.runtime.api.types.ObjectType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BFuture;
import io.ballerina.runtime.api.values.BLink;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BObject;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.runtime.internal.scheduling.Scheduler;
import io.ballerina.runtime.internal.scheduling.Strand;
import io.ballerina.runtime.internal.values.MapValue;
import io.ballerina.runtime.internal.values.ValueCreator;
import io.ballerina.stdlib.grpc.nativeimpl.ModuleUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * Interface to initiate processing of incoming remote calls.
 * <p>
 * Referenced from grpc-java implementation.
 * <p>
 * @since 0.980.0
 */
public class TestUtils {

    public static ValueCreator getValueCreatorWithErrorValue() {
        return new ValueCreator() {
            @Override
            public MapValue<BString, Object> createRecordValue(String s) throws BError {
                return null;
            }

            @Override
            public BObject createObjectValue(String s, Scheduler scheduler, Strand strand,
                                             Map<String, Object> map, Object[] objects) throws BError {
                return null;
            }

            @Override
            public BError createErrorValue(String s, BString bString, BError bError, Object o) throws BError {
                return ErrorCreator.createError(bString);
            }

            @Override
            public Type getAnonType(int i, String s) throws BError {
                return null;
            }
        };
    }

    public static BObject getBObject(Map<String, Field> fieldMap) {
        return new BObject() {
            private final HashMap<String, Object> nativeData = new HashMap();

            @Override
            public Object call(Strand strand, String s, Object... objects) {

                return null;
            }

            @Override
            public BFuture start(Strand strand, String s, Object... objects) {

                return null;
            }

            @Override
            public ObjectType getType() {
                if (fieldMap != null) {
                    ObjectType type = TypeCreator.createObjectType("testObjectType", ModuleUtils.getModule(), 0);
                    type.setFields(fieldMap);
                    return type;
                }
                return null;
            }

            @Override
            public Object get(BString bString) {

                return null;
            }

            @Override
            public long getIntValue(BString bString) {

                return 0;
            }

            @Override
            public double getFloatValue(BString bString) {

                return 0;
            }

            @Override
            public BString getStringValue(BString bString) {
                return (BString) nativeData.get(bString.getValue());
            }

            @Override
            public boolean getBooleanValue(BString bString) {

                return false;
            }

            @Override
            public BMap getMapValue(BString bString) {
                return (BMap) nativeData.get(bString.getValue());
            }

            @Override
            public BObject getObjectValue(BString bString) {

                return null;
            }

            @Override
            public BArray getArrayValue(BString bString) {

                return null;
            }

            @Override
            public void addNativeData(String s, Object o) {
                nativeData.put(s, o);
            }

            @Override
            public Object getNativeData(String s) {
                return nativeData.get(s);
            }

            @Override
            public HashMap<String, Object> getNativeData() {
                return nativeData;
            }

            @Override
            public void set(BString bString, Object o) {

            }

            @Override
            public Object copy(Map<Object, Object> map) {

                return null;
            }

            @Override
            public Object frozenCopy(Map<Object, Object> map) {

                return null;
            }

            @Override
            public String stringValue(BLink bLink) {

                return null;
            }

            @Override
            public String expressionStringValue(BLink bLink) {

                return null;
            }
        };
    }
}
