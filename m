Return-Path: <linux-leds+bounces-5712-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 763CEBCA6D2
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 19:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3AF7B4F0539
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 17:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E33324678D;
	Thu,  9 Oct 2025 17:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Uf4R3KtE"
X-Original-To: linux-leds@vger.kernel.org
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9532459EA;
	Thu,  9 Oct 2025 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760032176; cv=none; b=AlFU1xb20nGI5fyInF7z4lreW0+tC8vMfM5DRkWWwB2Q+m4osaK/+ViAwsRmzM00WNS702xO0g8RTIB75eQJeUKUklw0bk5oY9ZQWzqcQWRARohs9Qdr/GcX8W0i1PL3RLM3DoMAYHkZj/ZN9z/UU6P5Eg+bEiT/S6D5ilTe5GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760032176; c=relaxed/simple;
	bh=1tVP7fqS3d0YLLYFnZY+Zt1ySicBfn/Rj3MGNBUG7Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrUkEpOcEvE3uBGytLXonMxKOFlrAGnWsKR0+DrubI66BmZFLxlwS2drwdGHyz6TCDqQyrbzuzz3d2jMfAIZscy9jndA8JNuOiXLaKIrLEvQvoHeE60vhmEyUjh6BkyKSAeHLax/h2NMv0g1i1T//mNEtlwPQredfSOf3Mg5JLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Uf4R3KtE; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net [IPv6:2a02:6b8:c16:17a0:0:640:d1e1:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 33F948157D;
	Thu, 09 Oct 2025 20:49:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id OnOfjafLGmI0-EVlkIl1X;
	Thu, 09 Oct 2025 20:49:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1760032169;
	bh=1ePdLe5+6Vb1NUHqOJlhEoiSEGcWctHcEHtE4+Qo3Ls=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=Uf4R3KtE/GpMmMLWQMskXHQflQfltbzPMlGifuwUpgC5r8kdpUhWlgHGPmeEMwybJ
	 K5eaxOZXHOuAHR04ySWTo7WeT4pPY9EsmwZfzy01vU2yDM3cOB0DI+ZU0mri6Nzk1n
	 uwXvN7XvDb0f5a3v6IRlREvhpukBmnj/gf3beyII=
Authentication-Results: mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 9 Oct 2025 20:49:22 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Markus Probst <markus.probst@posteo.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: leds: add basic led classdev abstractions
Message-ID: <20251009204922.084da00b@nimda.home>
In-Reply-To: <20251009170739.235221-3-markus.probst@posteo.de>
References: <20251009170739.235221-1-markus.probst@posteo.de>
	<20251009170739.235221-3-markus.probst@posteo.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 09 Oct 2025 17:07:57 +0000
Markus Probst <markus.probst@posteo.de> wrote:

> Implement the core abstractions needed for led class devices,
> including:
> 
> * `led::Handler` - the trait for handling leds, including
>   `brightness_set`
> 
> * `led::InitData` - data set for the led class device
> 
> * `led::Device` - a safe wrapper arround `led_classdev`
> 

"arround" -> "around"

> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  rust/kernel/led.rs | 296
> +++++++++++++++++++++++++++++++++++++++++++++ rust/kernel/lib.rs |
> 1 + 2 files changed, 297 insertions(+)
>  create mode 100644 rust/kernel/led.rs
> 
> diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
> new file mode 100644
> index 000000000000..2fddc6088e09
> --- /dev/null
> +++ b/rust/kernel/led.rs
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for the leds driver model.
> +//!
> +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
> +
> +use core::pin::Pin;
> +
> +use pin_init::{pin_data, pinned_drop, PinInit};
> +
> +use crate::{
> +    alloc::KBox,
> +    container_of,
> +    device::{self, property::FwNode},
> +    error::{code::EINVAL, from_result, to_result, Error, Result},
> +    prelude::GFP_KERNEL,
> +    str::CStr,
> +    try_pin_init,
> +    types::Opaque,
> +};
> +
> +/// The led class device representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct
> led_classdev`. +#[pin_data(PinnedDrop)]
> +pub struct Device {
> +    handler: KBox<dyn HandlerImpl>,
> +    #[pin]
> +    classdev: Opaque<bindings::led_classdev>,
> +}
> +
> +/// The led init data representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct
> led_init_data`. +#[derive(Default)]
> +pub struct InitData<'a> {
> +    fwnode: Option<&'a FwNode>,
> +    default_label: Option<&'a CStr>,
> +    devicename: Option<&'a CStr>,
> +    devname_mandatory: bool,
> +}
> +
> +impl InitData<'static> {
> +    /// Creates a new [`LedInitData`]

I think you meant InitData here.

> +    pub fn new() -> Self {
> +        Self::default()
> +    }
> +}
> +
> +impl<'a> InitData<'a> {
> +    /// Sets the firmware node
> +    pub fn fwnode<'b, 'c>(self, fwnode: &'b FwNode) -> InitData<'c>
> +    where
> +        'a: 'c,
> +        'b: 'c,
> +    {
> +        InitData {
> +            fwnode: Some(fwnode),
> +            ..self
> +        }
> +    }
> +
> +    /// Sets a default label
> +    pub fn default_label<'b, 'c>(self, label: &'b CStr) ->
> InitData<'c>
> +    where
> +        'a: 'c,
> +        'b: 'c,
> +    {
> +        InitData {
> +            default_label: Some(label),
> +            ..self
> +        }
> +    }
> +
> +    /// Sets the device name
> +    pub fn devicename<'b, 'c>(self, devicename: &'b CStr) ->
> InitData<'c>
> +    where
> +        'a: 'c,
> +        'b: 'c,
> +    {
> +        InitData {
> +            devicename: Some(devicename),
> +            ..self
> +        }
> +    }
> +
> +    /// Sets if a device name is mandatory
> +    pub fn devicename_mandatory(self, mandatory: bool) -> Self {
> +        Self {
> +            devname_mandatory: mandatory,
> +
> +            ..self
> +        }
> +    }
> +}
> +
> +/// The led handler trait.
> +///
> +/// # Examples
> +///
> +///```
> +/// # use kernel::{c_str, led, alloc::KBox, error::{Result,
> code::ENOSYS}}; +/// # use core::pin::Pin;
> +///
> +/// struct MyHandler;
> +///
> +///
> +/// impl led::Handler for MyHandler {
> +///     const BLOCKING = false;
> +///     const MAX_BRIGHTNESS = 255;
> +///
> +///     fn brightness_set(&self, _brightness: u32) -> Result<()> {
> +///         // Set the brightness for the led here
> +///         Ok(())
> +///     }
> +/// }
> +///
> +/// fn register_my_led() -> Result<Pin<KBox<led::Device>>> {
> +///     let handler = MyHandler;
> +///     KBox::pin_init(led::Device::new(
> +///         None,
> +///         None,
> +///         led::InitData::new()
> +///             .default_label(c_str!("my_led")),
> +///         handler,
> +///     ))
> +/// }
> +///```
> +/// Led drivers must implement this trait in order to register and
> handle a [`Device`]. +pub trait Handler {
> +    /// If set true, [`Handler::brightness_set`] and
> [`Handler::blink_set`] must not sleep
> +    /// and perform the operation immediately.
> +    const BLOCKING: bool;
> +    /// Set this to true, if [`Handler::blink_set`] is implemented.
> +    const BLINK: bool = false;
> +    /// The max brightness level
> +    const MAX_BRIGHTNESS: u32;
> +
> +    /// Sets the brightness level
> +    ///
> +    /// See also [`Handler::BLOCKING`]
> +    fn brightness_set(&self, brightness: u32) -> Result<()>;
> +
> +    /// Activates hardware accelerated blinking.
> +    ///
> +    /// delays are in milliseconds. If both are zero, a sensible
> default should be chosen.
> +    /// The caller should adjust the timings in that case and if it
> can't match the values
> +    /// specified exactly. Setting the brightness to 0 will disable
> the hardware accelerated
> +    /// blinking.
> +    ///
> +    /// See also [`Handler::BLOCKING`]
> +    fn blink_set(&self, _delay_on: &mut usize, _delay_off: &mut
> usize) -> Result<()> {
> +        Err(EINVAL)
> +    }
> +}
> +
> +trait HandlerImpl {
> +    fn brightness_set(&self, brightness: u32) -> Result<()>;
> +    fn blink_set(&self, delay_on: &mut usize, delay_off: &mut usize)
> -> Result<()>; +}
> +
> +impl<T: Handler> HandlerImpl for T {
> +    fn brightness_set(&self, brightness: u32) -> Result<()> {
> +        T::brightness_set(self, brightness)
> +    }
> +
> +    fn blink_set(&self, delay_on: &mut usize, delay_off: &mut usize)
> -> Result<()> {
> +        T::blink_set(self, delay_on, delay_off)
> +    }
> +}
> +
> +// SAFETY: A `led::Device` can be unregistered from any thread.
> +unsafe impl Send for Device {}
> +
> +// SAFETY: `led::Device` can be shared among threads because all
> methods of `led::Device` +// are thread safe.
> +unsafe impl Sync for Device {}
> +
> +impl Device {
> +    /// Registers a new led classdev.
> +    ///
> +    /// The [`Device`] will be unregistered and drop.
> +    pub fn new<'a, T: Handler + 'static>(
> +        parent: Option<&'a device::Device>,
> +        init_data: InitData<'a>,
> +        handler: T,
> +    ) -> impl PinInit<Self, Error> + use<'a, T> {
> +        try_pin_init!(Self {
> +            handler <- {
> +                let handler: KBox<dyn HandlerImpl> =
> KBox::<T>::new(handler, GFP_KERNEL)?;
> +                Ok::<_, Error>(handler)
> +            },
> +            classdev <- Opaque::try_ffi_init(|ptr: *mut
> bindings::led_classdev| {
> +                // SAFETY: `try_ffi_init` guarantees that `ptr` is
> valid for write.
> +                unsafe { ptr.write(bindings::led_classdev {
> +                    max_brightness: T::MAX_BRIGHTNESS,
> +                    brightness_set: T::BLOCKING.then_some(
> +                        brightness_set as unsafe extern "C" fn(*mut
> bindings::led_classdev, u32)
> +                    ),
> +                    brightness_set_blocking:
> (!T::BLOCKING).then_some(
> +                        brightness_set_blocking
> +                            as unsafe extern "C" fn(*mut
> bindings::led_classdev,u32) -> i32
> +                    ),
> +                    blink_set: T::BLINK.then_some(
> +                        blink_set
> +                            as unsafe extern "C" fn(*mut
> bindings::led_classdev, *mut usize,
> +                                                    *mut usize) ->
> i32
> +                    ),
> +                    .. bindings::led_classdev::default()
> +                }) };
> +
> +                let mut init_data = bindings::led_init_data {
> +                    fwnode:
> init_data.fwnode.map_or(core::ptr::null_mut(), FwNode::as_raw),
> +                    default_label: init_data.default_label
> +
> .map_or(core::ptr::null(), CStr::as_char_ptr),
> +                    devicename:
> init_data.devicename.map_or(core::ptr::null(), CStr::as_char_ptr),
> +                    devname_mandatory: init_data.devname_mandatory,
> +                };
> +
> +                let parent = parent
> +                    .map_or(core::ptr::null_mut(),
> device::Device::as_raw); +
> +                // SAFETY:
> +                // - `parent` is guaranteed to be a pointer to a
> valid `device`
> +                //    or a null pointer.
> +                // - `ptr` is guaranteed to be a pointer to an
> initialized `led_classdev`.
> +                to_result(unsafe {
> +                    bindings::led_classdev_register_ext(parent, ptr,
> &mut init_data)
> +                })
> +            }),
> +        })
> +    }
> +}
> +
> +extern "C" fn brightness_set(led_cdev: *mut bindings::led_classdev,
> brightness: u32) {
> +    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev`
> stored inside a `Device`.
> +    let classdev = unsafe {
> +        &*container_of!(
> +            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
> +            Device,
> +            classdev
> +        )
> +    };
> +    let _ = classdev.handler.brightness_set(brightness);
> +}
> +
> +extern "C" fn brightness_set_blocking(
> +    led_cdev: *mut bindings::led_classdev,
> +    brightness: u32,
> +) -> i32 {
> +    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev`
> stored inside a `Device`.
> +    let classdev = unsafe {
> +        &*container_of!(
> +            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
> +            Device,
> +            classdev
> +        )
> +    };
> +    from_result(|| {
> +        classdev.handler.brightness_set(brightness)?;
> +        Ok(0)
> +    })
> +}
> +
> +extern "C" fn blink_set(
> +    led_cdev: *mut bindings::led_classdev,
> +    delay_on: *mut usize,
> +    delay_off: *mut usize,
> +) -> i32 {
> +    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev`
> stored inside a `Device`.
> +    let classdev = unsafe {
> +        &*container_of!(
> +            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
> +            Device,
> +            classdev
> +        )
> +    };
> +    from_result(|| {
> +        classdev.handler.blink_set(
> +            // SAFETY: `delay_on` is guaranteed to be a valid
> pointer to usize
> +            unsafe { &mut *delay_on },
> +            // SAFETY: `delay_on` is guaranteed to be a valid
> pointer to usize
> +            unsafe { &mut *delay_off },
> +        )?;
> +        Ok(0)
> +    })
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for Device {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: The existence of `self` guarantees that
> `self.classdev` has previously been
> +        // successfully registered with `led_classdev_register_ext`
> +        unsafe {
> bindings::led_classdev_unregister(self.classdev.get()) };
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index e5247f584ad2..f42c60da21ae 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -97,6 +97,7 @@
>  pub mod jump_label;
>  #[cfg(CONFIG_KUNIT)]
>  pub mod kunit;
> +pub mod led;
>  pub mod list;
>  pub mod miscdevice;
>  pub mod mm;


