// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: chatter.proto

#ifndef PROTOBUF_chatter_2eproto__INCLUDED
#define PROTOBUF_chatter_2eproto__INCLUDED

#include <string>

#include <google/protobuf/stubs/common.h>

#if GOOGLE_PROTOBUF_VERSION < 3000000
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please update
#error your headers.
#endif
#if 3000000 < GOOGLE_PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/arena.h>
#include <google/protobuf/arenastring.h>
#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/metadata.h>
#include <google/protobuf/message.h>
#include <google/protobuf/repeated_field.h>
#include <google/protobuf/extension_set.h>
#include <google/protobuf/unknown_field_set.h>
// @@protoc_insertion_point(includes)

// Internal implementation detail -- do not call these.
void protobuf_AddDesc_chatter_2eproto();
void protobuf_AssignDesc_chatter_2eproto();
void protobuf_ShutdownFile_chatter_2eproto();

class Counter;
class ShortMessage;

// ===================================================================

class ShortMessage : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:ShortMessage) */ {
 public:
  ShortMessage();
  virtual ~ShortMessage();

  ShortMessage(const ShortMessage& from);

  inline ShortMessage& operator=(const ShortMessage& from) {
    CopyFrom(from);
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _internal_metadata_.unknown_fields();
  }

  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return _internal_metadata_.mutable_unknown_fields();
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const ShortMessage& default_instance();

  void Swap(ShortMessage* other);

  // implements Message ----------------------------------------------

  inline ShortMessage* New() const { return New(NULL); }

  ShortMessage* New(::google::protobuf::Arena* arena) const;
  void CopyFrom(const ::google::protobuf::Message& from);
  void MergeFrom(const ::google::protobuf::Message& from);
  void CopyFrom(const ShortMessage& from);
  void MergeFrom(const ShortMessage& from);
  void Clear();
  bool IsInitialized() const;

  int ByteSize() const;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input);
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const;
  ::google::protobuf::uint8* InternalSerializeWithCachedSizesToArray(
      bool deterministic, ::google::protobuf::uint8* output) const;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output) const {
    return InternalSerializeWithCachedSizesToArray(false, output);
  }
  int GetCachedSize() const { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const;
  void InternalSwap(ShortMessage* other);
  private:
  inline ::google::protobuf::Arena* GetArenaNoVirtual() const {
    return _internal_metadata_.arena();
  }
  inline void* MaybeArenaPtr() const {
    return _internal_metadata_.raw_arena_ptr();
  }
  public:

  ::google::protobuf::Metadata GetMetadata() const;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  // required string content = 2;
  bool has_content() const;
  void clear_content();
  static const int kContentFieldNumber = 2;
  const ::std::string& content() const;
  void set_content(const ::std::string& value);
  void set_content(const char* value);
  void set_content(const char* value, size_t size);
  ::std::string* mutable_content();
  ::std::string* release_content();
  void set_allocated_content(::std::string* content);

  // @@protoc_insertion_point(class_scope:ShortMessage)
 private:
  inline void set_has_content();
  inline void clear_has_content();

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  ::google::protobuf::uint32 _has_bits_[1];
  mutable int _cached_size_;
  ::google::protobuf::internal::ArenaStringPtr content_;
  friend void  protobuf_AddDesc_chatter_2eproto();
  friend void protobuf_AssignDesc_chatter_2eproto();
  friend void protobuf_ShutdownFile_chatter_2eproto();

  void InitAsDefaultInstance();
  static ShortMessage* default_instance_;
};
// -------------------------------------------------------------------

class Counter : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:Counter) */ {
 public:
  Counter();
  virtual ~Counter();

  Counter(const Counter& from);

  inline Counter& operator=(const Counter& from) {
    CopyFrom(from);
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _internal_metadata_.unknown_fields();
  }

  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return _internal_metadata_.mutable_unknown_fields();
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const Counter& default_instance();

  void Swap(Counter* other);

  // implements Message ----------------------------------------------

  inline Counter* New() const { return New(NULL); }

  Counter* New(::google::protobuf::Arena* arena) const;
  void CopyFrom(const ::google::protobuf::Message& from);
  void MergeFrom(const ::google::protobuf::Message& from);
  void CopyFrom(const Counter& from);
  void MergeFrom(const Counter& from);
  void Clear();
  bool IsInitialized() const;

  int ByteSize() const;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input);
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const;
  ::google::protobuf::uint8* InternalSerializeWithCachedSizesToArray(
      bool deterministic, ::google::protobuf::uint8* output) const;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output) const {
    return InternalSerializeWithCachedSizesToArray(false, output);
  }
  int GetCachedSize() const { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const;
  void InternalSwap(Counter* other);
  private:
  inline ::google::protobuf::Arena* GetArenaNoVirtual() const {
    return _internal_metadata_.arena();
  }
  inline void* MaybeArenaPtr() const {
    return _internal_metadata_.raw_arena_ptr();
  }
  public:

  ::google::protobuf::Metadata GetMetadata() const;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  // required uint64 count = 1 [default = 0];
  bool has_count() const;
  void clear_count();
  static const int kCountFieldNumber = 1;
  ::google::protobuf::uint64 count() const;
  void set_count(::google::protobuf::uint64 value);

  // @@protoc_insertion_point(class_scope:Counter)
 private:
  inline void set_has_count();
  inline void clear_has_count();

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  ::google::protobuf::uint32 _has_bits_[1];
  mutable int _cached_size_;
  ::google::protobuf::uint64 count_;
  friend void  protobuf_AddDesc_chatter_2eproto();
  friend void protobuf_AssignDesc_chatter_2eproto();
  friend void protobuf_ShutdownFile_chatter_2eproto();

  void InitAsDefaultInstance();
  static Counter* default_instance_;
};
// ===================================================================


// ===================================================================

#if !PROTOBUF_INLINE_NOT_IN_HEADERS
// ShortMessage

// required string content = 2;
inline bool ShortMessage::has_content() const {
  return (_has_bits_[0] & 0x00000001u) != 0;
}
inline void ShortMessage::set_has_content() {
  _has_bits_[0] |= 0x00000001u;
}
inline void ShortMessage::clear_has_content() {
  _has_bits_[0] &= ~0x00000001u;
}
inline void ShortMessage::clear_content() {
  content_.ClearToEmptyNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
  clear_has_content();
}
inline const ::std::string& ShortMessage::content() const {
  // @@protoc_insertion_point(field_get:ShortMessage.content)
  return content_.GetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline void ShortMessage::set_content(const ::std::string& value) {
  set_has_content();
  content_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), value);
  // @@protoc_insertion_point(field_set:ShortMessage.content)
}
inline void ShortMessage::set_content(const char* value) {
  set_has_content();
  content_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), ::std::string(value));
  // @@protoc_insertion_point(field_set_char:ShortMessage.content)
}
inline void ShortMessage::set_content(const char* value, size_t size) {
  set_has_content();
  content_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(),
      ::std::string(reinterpret_cast<const char*>(value), size));
  // @@protoc_insertion_point(field_set_pointer:ShortMessage.content)
}
inline ::std::string* ShortMessage::mutable_content() {
  set_has_content();
  // @@protoc_insertion_point(field_mutable:ShortMessage.content)
  return content_.MutableNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline ::std::string* ShortMessage::release_content() {
  // @@protoc_insertion_point(field_release:ShortMessage.content)
  clear_has_content();
  return content_.ReleaseNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline void ShortMessage::set_allocated_content(::std::string* content) {
  if (content != NULL) {
    set_has_content();
  } else {
    clear_has_content();
  }
  content_.SetAllocatedNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), content);
  // @@protoc_insertion_point(field_set_allocated:ShortMessage.content)
}

// -------------------------------------------------------------------

// Counter

// required uint64 count = 1 [default = 0];
inline bool Counter::has_count() const {
  return (_has_bits_[0] & 0x00000001u) != 0;
}
inline void Counter::set_has_count() {
  _has_bits_[0] |= 0x00000001u;
}
inline void Counter::clear_has_count() {
  _has_bits_[0] &= ~0x00000001u;
}
inline void Counter::clear_count() {
  count_ = GOOGLE_ULONGLONG(0);
  clear_has_count();
}
inline ::google::protobuf::uint64 Counter::count() const {
  // @@protoc_insertion_point(field_get:Counter.count)
  return count_;
}
inline void Counter::set_count(::google::protobuf::uint64 value) {
  set_has_count();
  count_ = value;
  // @@protoc_insertion_point(field_set:Counter.count)
}

#endif  // !PROTOBUF_INLINE_NOT_IN_HEADERS
// -------------------------------------------------------------------


// @@protoc_insertion_point(namespace_scope)

// @@protoc_insertion_point(global_scope)

#endif  // PROTOBUF_chatter_2eproto__INCLUDED