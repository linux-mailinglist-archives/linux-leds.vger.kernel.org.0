Return-Path: <linux-leds+bounces-3827-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAFDA16B1D
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 11:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B1577A06C4
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 10:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3201B87C1;
	Mon, 20 Jan 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="VMyKulFy"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B464187872;
	Mon, 20 Jan 2025 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370759; cv=none; b=rnVT0OC/9DsbecudSKIFDzfy+UwpZLKWQOnB3WCynE5Sl+UbCkRYaxb9sYBnv2ZweWJ/M4QLuMEmqXeE3MWMqMNkCUYhEfr+b9aq6Hwckk0fLHbwtCBKVj+cAjF3hp+egwqdZxt5GwWd3Ra/ZbNE/bH6LsoC8vb10TXTe4sDxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370759; c=relaxed/simple;
	bh=j6qgH0sxIvnNh6OV8PNqaoDo8UQu8A3cFK0VMtMraQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opxamz26Lxgfn4Ubdh2aVaGFinyI6olM3ieF2NzVSdTW0HArg+HzRHiLlRNcyo7OH6tIHc2gukPIhvHd7anhIsGJkZpcqf4RFRJkXnVb4djD7waK/gBeexOiuPAaP5LPR2etB4sUAWEWSv7N3Jtjd5t5ZSrlIaAtP+XXi4woqvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=VMyKulFy; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1737370745; bh=RrvI1oTSbwGNkR3tliHMSgvwW8NvappFVPOMZ25ALB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VMyKulFy53YmkK9yjMy5F0nJrWw3DBvQSN3FyoFXRF8ZBcyxD5A7CKJA6pQW4PI8m
	 qoG2jVLLsmZRzmG+HNJUPQjDgbCTBfLpbyQ4HEm5Zl7U3t4h7Hn3mutLhzfpEWBU4S
	 p5yc9aU8df2JOrdZmptXJdKLzPrmCg4aC/LUVmDI=
To: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Peter Koch <pkoch@lenovo.com>, rust-for-linux@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] rust: leds: Add hardware trigger support for
 hardware-controlled LEDs
Date: Mon, 20 Jan 2025 11:59:03 +0100
Message-ID: <5366FB38-FF4C-4FC8-B116-9102381791D5@kloenk.dev>
In-Reply-To: <2rla4ga3v563gdjdg6fztyh6hardmxnnclfe667gnfs4icsiqo@eho3bcv53h7d>
References: <20250113121620.21598-1-me@kloenk.dev>
 <20250113121620.21598-4-me@kloenk.dev>
 <2rla4ga3v563gdjdg6fztyh6hardmxnnclfe667gnfs4icsiqo@eho3bcv53h7d>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 20 Jan 2025, at 11:35, Marek Beh=C3=BAn wrote:

> On Mon, Jan 13, 2025 at 01:16:18PM +0100, Fiona Behrens wrote:
>> Adds abstraction for hardware trigger support in LEDs, enabling LEDs t=
o
>> be controlled by external hardware events.
>>
>> An `Arc` is embedded within the `led_classdev` to manage the lifecycle=

>> of the hardware trigger, ensuring proper reference counting and cleanu=
p
>> when the LED is dropped.
>>
>> Signed-off-by: Fiona Behrens <me@kloenk.dev>
>> ---
>>  MAINTAINERS                  |   1 +
>>  rust/kernel/leds.rs          |  95 +++++++++++++++++++++++---
>>  rust/kernel/leds/triggers.rs | 128 ++++++++++++++++++++++++++++++++++=
+
>>  3 files changed, 214 insertions(+), 10 deletions(-)
>>  create mode 100644 rust/kernel/leds/triggers.rs
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cef929b57159..954dbd311a55 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13020,6 +13020,7 @@ F:	drivers/leds/
>>  F:	include/dt-bindings/leds/
>>  F:	include/linux/leds.h
>>  F:	rust/kernel/leds.rs
>> +F:	rust/kernel/leds/
>>
>>  LEGO MINDSTORMS EV3
>>  R:	David Lechner <david@lechnology.com>
>> diff --git a/rust/kernel/leds.rs b/rust/kernel/leds.rs
>> index 980af7c405d4..f10a10b56e23 100644
>> --- a/rust/kernel/leds.rs
>> +++ b/rust/kernel/leds.rs
>> @@ -10,9 +10,14 @@
>>  use crate::error::from_result;
>>  use crate::ffi::c_ulong;
>>  use crate::prelude::*;
>> +#[cfg(CONFIG_LEDS_TRIGGERS)]
>> +use crate::sync::Arc;
>>  use crate::time::Delta;
>>  use crate::types::Opaque;
>>
>> +#[cfg(CONFIG_LEDS_TRIGGERS)]
>> +pub mod triggers;
>> +
>>  /// Color of an LED.
>>  #[allow(missing_docs)]
>>  #[derive(Copy, Clone)]
>> @@ -110,12 +115,34 @@ fn try_from(value: u32) -> Result<Self, Self::Er=
ror> {
>>  }
>>
>>  /// Data used for led registration.
>> -#[derive(Clone)]
>> -pub struct LedConfig<'name> {
>> +pub struct LedConfig<'name, T> {
>>      /// Name to give the led.
>>      pub name: Option<&'name CStr>,
>>      /// Color of the LED.
>>      pub color: Color,
>> +    /// Private data of the LED.
>> +    pub data: T,
>> +
>> +    /// Default trigger name.
>> +    pub default_trigger: Option<&'static CStr>,
>> +    /// Hardware trigger.
>> +    ///
>> +    /// Setting this to some also defaults the default trigger to thi=
s hardware trigger.
>> +    /// Use `default_trigger: Some("none")` to overwrite this.
>> +    #[cfg(CONFIG_LEDS_TRIGGERS)]
>> +    pub hardware_trigger: Option<Arc<triggers::Hardware<T>>>,
>> +}
>> +
>> +impl<'name, T> LedConfig<'name, T> {
>> +    /// Create a new LedConfig
>> +    pub fn new(color: Color, data: T) -> Self {
>> +        Self {
>> +            color,
>> +            data,
>> +            // SAFETY: all other fields are valid with zeroes.
>> +            ..unsafe { core::mem::zeroed() }
>> +        }
>> +    }
>>  }
>>
>>  /// A Led backed by a C `struct led_classdev`, additionally offering
>> @@ -141,8 +168,7 @@ impl<T> Led<T>
>>      #[cfg(CONFIG_LEDS_CLASS)]
>>      pub fn register<'a>(
>>          device: Option<&'a Device>,
>> -        config: &'a LedConfig<'a>,
>> -        data: T,
>> +        config: LedConfig<'a, T>,
>>      ) -> impl PinInit<Self, Error> + 'a
>>      where
>>          T: 'a,
>> @@ -188,14 +214,46 @@ pub fn register<'a>(
>>                  unsafe { ptr::write(set_fn_ptr, Some(blink_set::<T>))=
 };
>>              }
>>
>> +        #[cfg(CONFIG_LEDS_TRIGGERS)]
>> +        if let Some(trigger) =3D config.hardware_trigger {
>> +            let trigger =3D trigger.into_raw();
>> +            // SAFETY: `place` is pointing to a live allocation.
>> +            let trigger_type_ptr =3D unsafe { ptr::addr_of_mut!((*pla=
ce).trigger_type) };
>> +            // SAFETY: `trigger` is a valid pointer
>> +            let hw_trigger =3D unsafe { ptr::addr_of!((*trigger).hw_t=
ype) };
>> +            // SAFETY: `trigger_type_ptr` points to a valid allocatio=
n and we have exclusive access.
>> +            unsafe { ptr::write(trigger_type_ptr, hw_trigger.cast_mut=
().cast()) };
>> +
>> +            // SAFETY: trigger points to a valid hardware trigger str=
uct.
>> +            let trigger_name_ptr =3D unsafe { Opaque::raw_get(ptr::ad=
dr_of!( (*trigger).trigger)) };
>> +            // SAFETY: trigger points to a valid hardware trigger str=
uct.
>> +            let trigger_name_ptr =3D unsafe { (*trigger_name_ptr).nam=
e };
>> +            // SAFETY: `place` is pointing to a live allocation.
>> +            let default_trigger_ptr =3D unsafe { ptr::addr_of_mut!((*=
place).default_trigger) };
>> +            // SAFETY: `default_trigger_ptr` points to a valid alloca=
tion and we have exclusive access.
>> +            unsafe { ptr::write(default_trigger_ptr, trigger_name_ptr=
) };
>> +
>> +            // SAFETY: `place` is pointing to a live allocation.
>> +            let hw_ctrl_trigger_ptr =3D unsafe { ptr::addr_of_mut!((*=
place).hw_control_trigger) };
>> +            // SAFETY: `hw_ctrl_trigger_ptr` points to a valid alloca=
tion and we have exclusive access.
>> +            unsafe { ptr::write(hw_ctrl_trigger_ptr, trigger_name_ptr=
) };
>> +        }
>> +
>> +        // After hw trigger impl, to overwrite default trigger
>> +        if let Some(default_trigger) =3D config.default_trigger {
>> +            // SAFETY: `place` is pointing to a live allocation.
>> +            let default_trigger_ptr =3D unsafe { ptr::addr_of_mut!((*=
place).default_trigger) };
>> +            // SAFETY: `default_trigger_ptr` points to a valid alloca=
tion and we have exclusive access.
>> +            unsafe { ptr::write(default_trigger_ptr, default_trigger.=
as_char_ptr()) };
>> +        }
>>
>> -            let dev =3D device.map(|dev| dev.as_raw()).unwrap_or(ptr:=
:null_mut());
>> -            // SAFETY: `place` is a pointer to a live allocation of `=
bindings::led_classdev`.
>> -            crate::error::to_result(unsafe {
>> -                bindings::led_classdev_register_ext(dev, place, ptr::=
null_mut())
>> -            })
>> +        let dev =3D device.map(|dev| dev.as_raw()).unwrap_or(ptr::nul=
l_mut());
>> +        // SAFETY: `place` is a pointer to a live allocation of `bind=
ings::led_classdev`.
>> +        crate::error::to_result(unsafe {
>> +                    bindings::led_classdev_register_ext(dev, place, p=
tr::null_mut())
>> +        })
>>              }),
>> -            data: data,
>> +            data: config.data,
>>          })
>>      }
>>  }
>> @@ -220,6 +278,23 @@ fn drop(self: Pin<&mut Self>) {
>>          unsafe {
>>              bindings::led_classdev_unregister(self.led.get())
>>          }
>> +
>> +        // drop trigger if there is a hw trigger defined.
>> +        #[cfg(CONFIG_LEDS_TRIGGERS)]
>> +        {
>> +            // SAFETY: `self.led` is a valid led.
>> +            let hw_trigger_type =3D
>> +                unsafe { ptr::read(ptr::addr_of!((*self.led.get()).tr=
igger_type)) };
>> +            if !hw_trigger_type.is_null() {
>> +                // SAFETY: hw_trigger_type is a valid and non null po=
inter into a Hardware trigger.
>> +                let hw_trigger_type =3D unsafe {
>> +                    crate::container_of!(hw_trigger_type, triggers::H=
ardware<T>, hw_type)
>> +                };
>> +                // SAFETY: `hw_trigger_type` is a valid pointer that =
came from an arc.
>> +                let hw_trigger_type =3D unsafe { Arc::from_raw(hw_tri=
gger_type) };
>> +                drop(hw_trigger_type);
>> +            }
>> +        }
>>      }
>>  }
>>
>> diff --git a/rust/kernel/leds/triggers.rs b/rust/kernel/leds/triggers.=
rs
>> new file mode 100644
>> index 000000000000..d5f2b8252645
>> --- /dev/null
>> +++ b/rust/kernel/leds/triggers.rs
>> @@ -0,0 +1,128 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! LED trigger abstractions.
>> +
>> +use core::marker::PhantomData;
>> +use core::ptr;
>> +
>> +use crate::error::{from_result, to_result};
>> +use crate::prelude::*;
>> +use crate::types::Opaque;
>> +
>> +use super::FromLedClassdev;
>> +
>> +/// LED Hardware trigger.
>> +///
>> +/// Used to impement a hardware operation mode for an LED.
>> +#[pin_data(PinnedDrop)]
>> +pub struct Hardware<T> {
>> +    #[pin]
>> +    pub(crate) hw_type: Opaque<bindings::led_hw_trigger_type>,
>
> This should probably be called trigger_type instead of hw_type,
> as it is in the C version of the code.
>
>> +    #[pin]
>> +    pub(crate) trigger: Opaque<bindings::led_trigger>,
>> +    _t: PhantomData<T>,
>> +}
>> +
>> +impl<T> Hardware<T>
>> +where
>> +    T: HardwareOperations,
>> +{
>> +    /// Register a new hardware Trigger with a given name.
>> +    pub fn register(name: &'static CStr) -> impl PinInit<Self, Error>=
 {
>> +        try_pin_init!( Self {
>> +            // SAFETY: `led_hw_trigger_type` is valid with all zeroes=
=2E
>> +            hw_type: Opaque::new(unsafe { core::mem::zeroed() }),
>> +            trigger <- Opaque::try_ffi_init(move |place: *mut binding=
s::led_trigger| {
>> +            // SAFETY: `place` is a pointer to a live allocation, so =
erasing is valid.
>> +            unsafe { place.write_bytes(0, 1) };
>> +
>> +            // Add name
>> +            // SAFETY: `place` is pointing to a live allocation, so t=
he deref is safe.
>> +            let name_ptr =3D unsafe { ptr::addr_of_mut!((*place).name=
) };
>> +            // SAFETY: `name_ptr` points to a valid allocation and we=
 have exclusive access.
>> +            unsafe { ptr::write(name_ptr, name.as_char_ptr()) };
>> +
>> +            // Add fn pointers
>> +            // SAFETY: `place` is pointing to a live allocation, so t=
he deref is safe.
>> +            let activate_fn_ptr: *mut Option<_> =3D unsafe { ptr::add=
r_of_mut!((*place).activate) };
>> +            // SAFETY: `activate_fn_ptr` points to a valid allocation=
 and we have exclusive access.
>> +            unsafe { ptr::write(activate_fn_ptr, Some(trigger_activat=
e::<T>)) };
>> +
>> +            if T::HAS_DEACTIVATE {
>> +                // SAFETY: `place` is pointing to a live allocation, =
so the deref is safe.
>> +                let deactivate_fn_ptr: *mut Option<_> =3D unsafe { pt=
r::addr_of_mut!((*place).deactivate) };
>> +                // SAFETY: `deactivate_fn_ptr` points to a valid allo=
cation and we have exclusive access.
>> +                unsafe { ptr::write(deactivate_fn_ptr, Some(trigger_d=
eactivate::<T>)) };
>> +            }
>> +
>> +            // Add hardware trigger
>> +            // SAFETY: `place` is pointing to a live allocation, so t=
he deref is safe.
>> +            let trigger_type_ptr =3D unsafe { ptr::addr_of_mut!((*pla=
ce).trigger_type) };
>> +            // SAFETY: `place` is pointing to a live allocation, so t=
he deref is safe.
>> +            let trigger_type =3D unsafe { crate::container_of!(place,=
 Self, trigger).cast_mut() };
>> +            // SAFETY: `trigger_type` is pointing to a live allocatio=
n of Self.
>> +            let trigger_type =3D unsafe { ptr::addr_of!((*trigger_typ=
e).hw_type) };
>> +            // SAFETY: `trigger_type_ptr` points to a valid allocatio=
n and we have exclusive access.
>> +            unsafe{ ptr::write(trigger_type_ptr, Opaque::raw_get(trig=
ger_type)) };
>> +
>> +        // SAFETY: ffi call, `place` is sufficently filled with data =
at this point
>> +            to_result(unsafe {
>> +                bindings::led_trigger_register(place)
>> +            })
>> +            }),
>> +            _t: PhantomData,
>> +        })
>> +    }
>> +}
>> +
>> +#[pinned_drop]
>> +impl<T> PinnedDrop for Hardware<T> {
>> +    fn drop(self: Pin<&mut Self>) {
>> +        // SAFETY: trigger is pointing to a live and registered alloc=
ation
>> +        unsafe {
>> +            bindings::led_trigger_unregister(self.trigger.get());
>> +        }
>> +    }
>> +}
>> +
>> +/// Operations for the Hardware trigger
>> +#[macros::vtable]
>> +pub trait HardwareOperations: super::Operations {
>> +    /// Activate the hardware trigger.
>> +    fn activate(this: &mut Self::This) -> Result;
>> +    /// Deactivate the hardware trigger.
>> +    fn deactivate(_this: &mut Self::This) {
>> +        crate::build_error(crate::error::VTABLE_DEFAULT_ERROR)
>> +    }
>> +}
>
> This looks as if you are doing a Rust binding for struct led_trigger.
> But you keep calling it Hardware trigger, which makes me thing that
> you are confused about what is a LED trigger and what is a hardware
> trigger.
>
> Why do you keep putting "Hardware" into the names of these symbols?

The idea was to create a abstraction specific to writing a hardware trigg=
er (or my understanding of what that is) and deal with the other
trigger types later, to more separate the things on the rust side with e.=
g. the vtables for those.
But my understanding might be wrong.

(My broad understanding is what I did in the SE10 driver later, to tell t=
he hardware to not present the LED to the kernel, but some other hardware=
 wiring to a hardware thing that then drives the LED)

>
> I fear that you may be confused about some stuff here. In order to
> determine whether this is the case, could you answer the following
> questions please?

That might be right, thanks for trying to clear it up if that is the case=
=2E

> - What is the purpose of `struct led_hw_trigger_type`?
Marking a led that it has a private trigger that gives control of the LED=
 to some hardware driver.
> - What is the purpose of the `dummy` member of this struct? What
>   value should be assigned to it?
=46rom my understanding this is just to give the struct a size, so that i=
t has a unique address in memory so the pointer value can be compared.
> - If a LED class device (LED cdev) has the `trigger_type` member set
>   to NULL, which LED triggers will be listed in the sysfs `trigger`
>   file for this LED cdev? And which triggers will be listed if the
>   `trigger_type` member is not NULL?
For null all generic triggers will be listed, and for some value all gene=
ric plus the specific trigger.
> - Why does both `struct led_classdev` and `struct led_trigger` have
>   the `trigger_type` member?
led_classdev has it to declare that it does have a led private trigger mo=
de, and the led_trigger has it so the activate/deactive functions can be =
found.

My research so far into how triggers work was mostly so that I can use th=
e wwan module trigger on the SE10 board I have here, and therefore I did =
not look into how to write a generic led trigger usable on more then a sp=
ecific led.

Thanks a lot for clearing up possible misunderstandings,
Fiona
>
>> +/// `trigger_activate` function pointer
>> +///
>> +/// # Safety
>> +///
>> +/// `led_cdev` must be passed by the corresponding callback in `led_t=
rigger`.
>> +unsafe extern "C" fn trigger_activate<T>(led_cdev: *mut bindings::led=
_classdev) -> i32
>> +where
>> +    T: HardwareOperations,
>> +{
>> +    from_result(|| {
>> +        // SAFETY: By the safety requirement of this function `led_cd=
ev` is embedded inside a `T::This<T>`.
>> +        let led =3D unsafe { &mut *(T::This::led_container_of(led_cde=
v.cast())) };
>> +        T::activate(led)?;
>> +        Ok(0)
>> +    })
>> +}
>> +
>> +/// `trigger_deactivate` function pointer
>> +///
>> +/// # Safety
>> +///
>> +/// `led_cdev` must be passed by the corresponding callback in `led_t=
rigger`.
>> +unsafe extern "C" fn trigger_deactivate<T>(led_cdev: *mut bindings::l=
ed_classdev)
>> +where
>> +    T: HardwareOperations,
>> +{
>> +    // SAFETY: By the safety requirement of this function `led_cdev` =
is embedded inside a `T::This<T>`.
>> +    let led =3D unsafe { &mut *(T::This::led_container_of(led_cdev.ca=
st())) };
>> +    T::deactivate(led)
>> +}
>> -- =

>> 2.47.0
>>
>>

