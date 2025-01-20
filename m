Return-Path: <linux-leds+bounces-3825-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C80A16AD9
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 11:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE5BD3A5F6D
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 10:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB5B1B414F;
	Mon, 20 Jan 2025 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8AKR6LA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2024B190696;
	Mon, 20 Jan 2025 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737369308; cv=none; b=og3YBLApy8zroZkVcyCWeeEg9q0Ouy+orVMJcd8rp23iSsFOj9F2Ubpi7n4rQCl+O42WqQodXEpkHCf1F+OIXS42p83nTWA6MwOrv4rRsHzHeC1lPeyH4ZyYMXpfulRjXX2l4MDbEza2tTG1LhQ6CmQ9KK/b6nJjyESlAqzafBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737369308; c=relaxed/simple;
	bh=X/imcss0TVx1LZX48V2dOKuK1Cb595JraR7hbC8Okgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAmOXh4HE5XHjGlqOirV90NaBg2vgzm1eD4aDXDBl0/YbvIopxG/LePTjJx8lcCxmA2o8PV5aqyAMaJM58cHh2sEJ1TZEEeBK0P2nsbTzYTkJhAXqL4jRbVP3yMtsYtcFdxCXW41Mz8crSmYrM+9QtYb2vPz5qkiwlr65KT3Y3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8AKR6LA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF415C4CEDD;
	Mon, 20 Jan 2025 10:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737369307;
	bh=X/imcss0TVx1LZX48V2dOKuK1Cb595JraR7hbC8Okgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8AKR6LA96xT8XG6QMifO+Zhy8kJc+Z7/ArY8q6LDLp3lvzutbrbsWplg1zXCDdWO
	 BDV/vR1W5UpSZ5rdiUvZXrHh6bwGZEL+SCDI4T+23wNvg4Cwp/VUHhvnPsGsYXRREL
	 ovVHYkpuw7vdFJAeAJcL9Q7JfADNlitdtZzTNiwN1CEBA1xC9uXT0np1pbSjk3KWP2
	 QTIGIWLXygccTAkRUUJRR2A9TFLVwdJWjNzp7EdpIMVUrs/ckQXoPJPMf+aMYGWGP/
	 0mlgc80F21t/nORBIeYKPeSeS4xCpGga971UaIFKq2/J/cxBUMEMgRuoKwgpKR9ku6
	 DJBlm6E0SKu+w==
Date: Mon, 20 Jan 2025 11:35:01 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Fiona Behrens <me@kloenk.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Peter Koch <pkoch@lenovo.com>, rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] rust: leds: Add hardware trigger support for
 hardware-controlled LEDs
Message-ID: <2rla4ga3v563gdjdg6fztyh6hardmxnnclfe667gnfs4icsiqo@eho3bcv53h7d>
References: <20250113121620.21598-1-me@kloenk.dev>
 <20250113121620.21598-4-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113121620.21598-4-me@kloenk.dev>

On Mon, Jan 13, 2025 at 01:16:18PM +0100, Fiona Behrens wrote:
> Adds abstraction for hardware trigger support in LEDs, enabling LEDs to
> be controlled by external hardware events.
> 
> An `Arc` is embedded within the `led_classdev` to manage the lifecycle
> of the hardware trigger, ensuring proper reference counting and cleanup
> when the LED is dropped.
> 
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> ---
>  MAINTAINERS                  |   1 +
>  rust/kernel/leds.rs          |  95 +++++++++++++++++++++++---
>  rust/kernel/leds/triggers.rs | 128 +++++++++++++++++++++++++++++++++++
>  3 files changed, 214 insertions(+), 10 deletions(-)
>  create mode 100644 rust/kernel/leds/triggers.rs
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cef929b57159..954dbd311a55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13020,6 +13020,7 @@ F:	drivers/leds/
>  F:	include/dt-bindings/leds/
>  F:	include/linux/leds.h
>  F:	rust/kernel/leds.rs
> +F:	rust/kernel/leds/
>  
>  LEGO MINDSTORMS EV3
>  R:	David Lechner <david@lechnology.com>
> diff --git a/rust/kernel/leds.rs b/rust/kernel/leds.rs
> index 980af7c405d4..f10a10b56e23 100644
> --- a/rust/kernel/leds.rs
> +++ b/rust/kernel/leds.rs
> @@ -10,9 +10,14 @@
>  use crate::error::from_result;
>  use crate::ffi::c_ulong;
>  use crate::prelude::*;
> +#[cfg(CONFIG_LEDS_TRIGGERS)]
> +use crate::sync::Arc;
>  use crate::time::Delta;
>  use crate::types::Opaque;
>  
> +#[cfg(CONFIG_LEDS_TRIGGERS)]
> +pub mod triggers;
> +
>  /// Color of an LED.
>  #[allow(missing_docs)]
>  #[derive(Copy, Clone)]
> @@ -110,12 +115,34 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
>  }
>  
>  /// Data used for led registration.
> -#[derive(Clone)]
> -pub struct LedConfig<'name> {
> +pub struct LedConfig<'name, T> {
>      /// Name to give the led.
>      pub name: Option<&'name CStr>,
>      /// Color of the LED.
>      pub color: Color,
> +    /// Private data of the LED.
> +    pub data: T,
> +
> +    /// Default trigger name.
> +    pub default_trigger: Option<&'static CStr>,
> +    /// Hardware trigger.
> +    ///
> +    /// Setting this to some also defaults the default trigger to this hardware trigger.
> +    /// Use `default_trigger: Some("none")` to overwrite this.
> +    #[cfg(CONFIG_LEDS_TRIGGERS)]
> +    pub hardware_trigger: Option<Arc<triggers::Hardware<T>>>,
> +}
> +
> +impl<'name, T> LedConfig<'name, T> {
> +    /// Create a new LedConfig
> +    pub fn new(color: Color, data: T) -> Self {
> +        Self {
> +            color,
> +            data,
> +            // SAFETY: all other fields are valid with zeroes.
> +            ..unsafe { core::mem::zeroed() }
> +        }
> +    }
>  }
>  
>  /// A Led backed by a C `struct led_classdev`, additionally offering
> @@ -141,8 +168,7 @@ impl<T> Led<T>
>      #[cfg(CONFIG_LEDS_CLASS)]
>      pub fn register<'a>(
>          device: Option<&'a Device>,
> -        config: &'a LedConfig<'a>,
> -        data: T,
> +        config: LedConfig<'a, T>,
>      ) -> impl PinInit<Self, Error> + 'a
>      where
>          T: 'a,
> @@ -188,14 +214,46 @@ pub fn register<'a>(
>                  unsafe { ptr::write(set_fn_ptr, Some(blink_set::<T>)) };
>              }
>  
> +        #[cfg(CONFIG_LEDS_TRIGGERS)]
> +        if let Some(trigger) = config.hardware_trigger {
> +            let trigger = trigger.into_raw();
> +            // SAFETY: `place` is pointing to a live allocation.
> +            let trigger_type_ptr = unsafe { ptr::addr_of_mut!((*place).trigger_type) };
> +            // SAFETY: `trigger` is a valid pointer
> +            let hw_trigger = unsafe { ptr::addr_of!((*trigger).hw_type) };
> +            // SAFETY: `trigger_type_ptr` points to a valid allocation and we have exclusive access.
> +            unsafe { ptr::write(trigger_type_ptr, hw_trigger.cast_mut().cast()) };
> +
> +            // SAFETY: trigger points to a valid hardware trigger struct.
> +            let trigger_name_ptr = unsafe { Opaque::raw_get(ptr::addr_of!( (*trigger).trigger)) };
> +            // SAFETY: trigger points to a valid hardware trigger struct.
> +            let trigger_name_ptr = unsafe { (*trigger_name_ptr).name };
> +            // SAFETY: `place` is pointing to a live allocation.
> +            let default_trigger_ptr = unsafe { ptr::addr_of_mut!((*place).default_trigger) };
> +            // SAFETY: `default_trigger_ptr` points to a valid allocation and we have exclusive access.
> +            unsafe { ptr::write(default_trigger_ptr, trigger_name_ptr) };
> +
> +            // SAFETY: `place` is pointing to a live allocation.
> +            let hw_ctrl_trigger_ptr = unsafe { ptr::addr_of_mut!((*place).hw_control_trigger) };
> +            // SAFETY: `hw_ctrl_trigger_ptr` points to a valid allocation and we have exclusive access.
> +            unsafe { ptr::write(hw_ctrl_trigger_ptr, trigger_name_ptr) };
> +        }
> +
> +        // After hw trigger impl, to overwrite default trigger
> +        if let Some(default_trigger) = config.default_trigger {
> +            // SAFETY: `place` is pointing to a live allocation.
> +            let default_trigger_ptr = unsafe { ptr::addr_of_mut!((*place).default_trigger) };
> +            // SAFETY: `default_trigger_ptr` points to a valid allocation and we have exclusive access.
> +            unsafe { ptr::write(default_trigger_ptr, default_trigger.as_char_ptr()) };
> +        }
>  
> -            let dev = device.map(|dev| dev.as_raw()).unwrap_or(ptr::null_mut());
> -            // SAFETY: `place` is a pointer to a live allocation of `bindings::led_classdev`.
> -            crate::error::to_result(unsafe {
> -                bindings::led_classdev_register_ext(dev, place, ptr::null_mut())
> -            })
> +        let dev = device.map(|dev| dev.as_raw()).unwrap_or(ptr::null_mut());
> +        // SAFETY: `place` is a pointer to a live allocation of `bindings::led_classdev`.
> +        crate::error::to_result(unsafe {
> +                    bindings::led_classdev_register_ext(dev, place, ptr::null_mut())
> +        })
>              }),
> -            data: data,
> +            data: config.data,
>          })
>      }
>  }
> @@ -220,6 +278,23 @@ fn drop(self: Pin<&mut Self>) {
>          unsafe {
>              bindings::led_classdev_unregister(self.led.get())
>          }
> +
> +        // drop trigger if there is a hw trigger defined.
> +        #[cfg(CONFIG_LEDS_TRIGGERS)]
> +        {
> +            // SAFETY: `self.led` is a valid led.
> +            let hw_trigger_type =
> +                unsafe { ptr::read(ptr::addr_of!((*self.led.get()).trigger_type)) };
> +            if !hw_trigger_type.is_null() {
> +                // SAFETY: hw_trigger_type is a valid and non null pointer into a Hardware trigger.
> +                let hw_trigger_type = unsafe {
> +                    crate::container_of!(hw_trigger_type, triggers::Hardware<T>, hw_type)
> +                };
> +                // SAFETY: `hw_trigger_type` is a valid pointer that came from an arc.
> +                let hw_trigger_type = unsafe { Arc::from_raw(hw_trigger_type) };
> +                drop(hw_trigger_type);
> +            }
> +        }
>      }
>  }
>  
> diff --git a/rust/kernel/leds/triggers.rs b/rust/kernel/leds/triggers.rs
> new file mode 100644
> index 000000000000..d5f2b8252645
> --- /dev/null
> +++ b/rust/kernel/leds/triggers.rs
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! LED trigger abstractions.
> +
> +use core::marker::PhantomData;
> +use core::ptr;
> +
> +use crate::error::{from_result, to_result};
> +use crate::prelude::*;
> +use crate::types::Opaque;
> +
> +use super::FromLedClassdev;
> +
> +/// LED Hardware trigger.
> +///
> +/// Used to impement a hardware operation mode for an LED.
> +#[pin_data(PinnedDrop)]
> +pub struct Hardware<T> {
> +    #[pin]
> +    pub(crate) hw_type: Opaque<bindings::led_hw_trigger_type>,

This should probably be called trigger_type instead of hw_type,
as it is in the C version of the code.

> +    #[pin]
> +    pub(crate) trigger: Opaque<bindings::led_trigger>,
> +    _t: PhantomData<T>,
> +}
> +
> +impl<T> Hardware<T>
> +where
> +    T: HardwareOperations,
> +{
> +    /// Register a new hardware Trigger with a given name.
> +    pub fn register(name: &'static CStr) -> impl PinInit<Self, Error> {
> +        try_pin_init!( Self {
> +            // SAFETY: `led_hw_trigger_type` is valid with all zeroes.
> +            hw_type: Opaque::new(unsafe { core::mem::zeroed() }),
> +            trigger <- Opaque::try_ffi_init(move |place: *mut bindings::led_trigger| {
> +            // SAFETY: `place` is a pointer to a live allocation, so erasing is valid.
> +            unsafe { place.write_bytes(0, 1) };
> +
> +            // Add name
> +            // SAFETY: `place` is pointing to a live allocation, so the deref is safe.
> +            let name_ptr = unsafe { ptr::addr_of_mut!((*place).name) };
> +            // SAFETY: `name_ptr` points to a valid allocation and we have exclusive access.
> +            unsafe { ptr::write(name_ptr, name.as_char_ptr()) };
> +
> +            // Add fn pointers
> +            // SAFETY: `place` is pointing to a live allocation, so the deref is safe.
> +            let activate_fn_ptr: *mut Option<_> = unsafe { ptr::addr_of_mut!((*place).activate) };
> +            // SAFETY: `activate_fn_ptr` points to a valid allocation and we have exclusive access.
> +            unsafe { ptr::write(activate_fn_ptr, Some(trigger_activate::<T>)) };
> +
> +            if T::HAS_DEACTIVATE {
> +                // SAFETY: `place` is pointing to a live allocation, so the deref is safe.
> +                let deactivate_fn_ptr: *mut Option<_> = unsafe { ptr::addr_of_mut!((*place).deactivate) };
> +                // SAFETY: `deactivate_fn_ptr` points to a valid allocation and we have exclusive access.
> +                unsafe { ptr::write(deactivate_fn_ptr, Some(trigger_deactivate::<T>)) };
> +            }
> +
> +            // Add hardware trigger
> +            // SAFETY: `place` is pointing to a live allocation, so the deref is safe.
> +            let trigger_type_ptr = unsafe { ptr::addr_of_mut!((*place).trigger_type) };
> +            // SAFETY: `place` is pointing to a live allocation, so the deref is safe.
> +            let trigger_type = unsafe { crate::container_of!(place, Self, trigger).cast_mut() };
> +            // SAFETY: `trigger_type` is pointing to a live allocation of Self.
> +            let trigger_type = unsafe { ptr::addr_of!((*trigger_type).hw_type) };
> +            // SAFETY: `trigger_type_ptr` points to a valid allocation and we have exclusive access.
> +            unsafe{ ptr::write(trigger_type_ptr, Opaque::raw_get(trigger_type)) };
> +
> +        // SAFETY: ffi call, `place` is sufficently filled with data at this point
> +            to_result(unsafe {
> +                bindings::led_trigger_register(place)
> +            })
> +            }),
> +            _t: PhantomData,
> +        })
> +    }
> +}
> +
> +#[pinned_drop]
> +impl<T> PinnedDrop for Hardware<T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: trigger is pointing to a live and registered allocation
> +        unsafe {
> +            bindings::led_trigger_unregister(self.trigger.get());
> +        }
> +    }
> +}
> +
> +/// Operations for the Hardware trigger
> +#[macros::vtable]
> +pub trait HardwareOperations: super::Operations {
> +    /// Activate the hardware trigger.
> +    fn activate(this: &mut Self::This) -> Result;
> +    /// Deactivate the hardware trigger.
> +    fn deactivate(_this: &mut Self::This) {
> +        crate::build_error(crate::error::VTABLE_DEFAULT_ERROR)
> +    }
> +}

This looks as if you are doing a Rust binding for struct led_trigger.
But you keep calling it Hardware trigger, which makes me thing that
you are confused about what is a LED trigger and what is a hardware
trigger.

Why do you keep putting "Hardware" into the names of these symbols?

I fear that you may be confused about some stuff here. In order to
determine whether this is the case, could you answer the following
questions please?
- What is the purpose of `struct led_hw_trigger_type`?
- What is the purpose of the `dummy` member of this struct? What
  value should be assigned to it?
- If a LED class device (LED cdev) has the `trigger_type` member set
  to NULL, which LED triggers will be listed in the sysfs `trigger`
  file for this LED cdev? And which triggers will be listed if the
  `trigger_type` member is not NULL?
- Why does both `struct led_classdev` and `struct led_trigger` have
  the `trigger_type` member?

> +/// `trigger_activate` function pointer
> +///
> +/// # Safety
> +///
> +/// `led_cdev` must be passed by the corresponding callback in `led_trigger`.
> +unsafe extern "C" fn trigger_activate<T>(led_cdev: *mut bindings::led_classdev) -> i32
> +where
> +    T: HardwareOperations,
> +{
> +    from_result(|| {
> +        // SAFETY: By the safety requirement of this function `led_cdev` is embedded inside a `T::This<T>`.
> +        let led = unsafe { &mut *(T::This::led_container_of(led_cdev.cast())) };
> +        T::activate(led)?;
> +        Ok(0)
> +    })
> +}
> +
> +/// `trigger_deactivate` function pointer
> +///
> +/// # Safety
> +///
> +/// `led_cdev` must be passed by the corresponding callback in `led_trigger`.
> +unsafe extern "C" fn trigger_deactivate<T>(led_cdev: *mut bindings::led_classdev)
> +where
> +    T: HardwareOperations,
> +{
> +    // SAFETY: By the safety requirement of this function `led_cdev` is embedded inside a `T::This<T>`.
> +    let led = unsafe { &mut *(T::This::led_container_of(led_cdev.cast())) };
> +    T::deactivate(led)
> +}
> -- 
> 2.47.0
> 
> 

