Return-Path: <linux-leds+bounces-8400-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO8CKHvpG2o0HQkAu9opvQ
	(envelope-from <linux-leds+bounces-8400-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 31 May 2026 09:55:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF73614DFB
	for <lists+linux-leds@lfdr.de>; Sun, 31 May 2026 09:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0003C301993F
	for <lists+linux-leds@lfdr.de>; Sun, 31 May 2026 07:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF45379C3C;
	Sun, 31 May 2026 07:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="ouGqrd4X"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DC2329367;
	Sun, 31 May 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780214134; cv=none; b=gXF9+m6Ro3tYNQlW9JugWau74EHQ36g8AAE3XKi8u8KMQ6tZ/cI8QupxrJb9YlRy6kfCD6KZUZaXgOgg4aFLB1kqjq4kUOvpS4soMgAJo6KY6Ms/AwXnVNokloMeBriFnEqJ4YqBjUR7SeLGcgfpLogoHbICPhmKo7whdZKOI7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780214134; c=relaxed/simple;
	bh=Yii34+Sz09zsy5kAXE7R6oZ3uTOBxuEaVThnYPtZeYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VYsxzMesi1my1DxvROQW5XCXOvxkwvCO0PtnUHFWpgGZUFtUzYxUIX+JCeiytAV3iKhL1Sguv3n3vbfgRioLmmxXVWpPv4TANFxibhkz/CtAVwMRaAMWeSY0rJmQvOILlctxifWOvD9ek7Ru9zv6tVnr3QK4WodRxmp5nNTw2P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=ouGqrd4X; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1780214121; x=1780473321;
	bh=zEVw+fFY9g6MS14O+Djhi3ji8Vs7hzXmYQkNOpXGwGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ouGqrd4X60cpOoD4qpnnvFhqO6joUYgxAcBEFzn1snVhHYbtZH7VZtUlXLiAH9OeS
	 0nUYZxBmsPv+Ce0np6kyecVtcsVpp2hN7ABTEhQkBe/meNjJJMtK62iRF8aR1v7Jcg
	 nsa1McX4DjffYqQJlABRv/vEzaxxzQ5fRoxrRA9lLI39Uo2QUG0HhrEy2IoDXDoGt+
	 qfX+KxzssWLiXoGx75ifUGQ9/E2+NTl7icKghkG1cgvLjlUk9EjTIPgQbJWiobwJ6n
	 PZHxpb+jhgWgJaUGJIz3s16EY2rzey5Tk5wzTejr/k9UsTyTsTmBVyt+0HCIHSVsS5
	 7JgpKflLZMAQw==
X-Pm-Submission-Id: 4gSqBr16x8z1DF6h
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v18 3/3] rust: leds: add multicolor classdev abstractions
Date: Sun, 31 May 2026 10:55:02 +0300
Message-ID: <20260531075514.47769-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260531-rust_leds-v18-3-d07102ba5170@posteo.de>
References: <20260531-rust_leds-v18-0-d07102ba5170@posteo.de> <20260531-rust_leds-v18-3-d07102ba5170@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8400-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,self.channel:url,onurozkan.dev:mid,onurozkan.dev:dkim,posteo.de:email]
X-Rspamd-Queue-Id: EFF73614DFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 30 May 2026 22:49:58 +0000=0D
Markus Probst <markus.probst@posteo.de> wrote:=0D
=0D
> Implement the abstractions needed for multicolor led class devices,=0D
> including:=0D
> =0D
> * `led::MultiColor` - the led mode implementation=0D
> =0D
> * `MultiColorSubLed` - a safe wrapper arround `mc_subled`=0D
> =0D
> * `led::MultiColorDevice` - a safe wrapper around `led_classdev_mc`=0D
> =0D
> * `led::DeviceBuilder::build_multicolor` - a function to register a new=0D
>   multicolor led class device=0D
> =0D
> Signed-off-by: Markus Probst <markus.probst@posteo.de>=0D
> ---=0D
>  rust/bindings/bindings_helper.h |   1 +=0D
>  rust/kernel/led.rs              |  34 +++-=0D
>  rust/kernel/led/multicolor.rs   | 405 ++++++++++++++++++++++++++++++++++=
++++++=0D
>  3 files changed, 439 insertions(+), 1 deletion(-)=0D
> =0D
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h=0D
> index 446dbeaf0866..17b5461453e0 100644=0D
> --- a/rust/bindings/bindings_helper.h=0D
> +++ b/rust/bindings/bindings_helper.h=0D
> @@ -67,6 +67,7 @@=0D
>  #include <linux/iosys-map.h>=0D
>  #include <linux/jiffies.h>=0D
>  #include <linux/jump_label.h>=0D
> +#include <linux/led-class-multicolor.h>=0D
>  #include <linux/mdio.h>=0D
>  #include <linux/mm.h>=0D
>  #include <linux/miscdevice.h>=0D
> diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs=0D
> index 6ee337008db7..4540c4e5c9d7 100644=0D
> --- a/rust/kernel/led.rs=0D
> +++ b/rust/kernel/led.rs=0D
> @@ -30,8 +30,16 @@=0D
>      types::Opaque, //=0D
>  };=0D
>  =0D
> +#[cfg(CONFIG_LEDS_CLASS_MULTICOLOR)]=0D
> +mod multicolor;=0D
>  mod normal;=0D
>  =0D
> +#[cfg(CONFIG_LEDS_CLASS_MULTICOLOR)]=0D
> +pub use multicolor::{=0D
> +    MultiColor,=0D
> +    MultiColorDevice,=0D
> +    MultiColorSubLed, //=0D
> +};=0D
>  pub use normal::{=0D
>      Device,=0D
>      Normal, //=0D
> @@ -255,7 +263,24 @@ pub enum Color {=0D
>      Violet =3D bindings::LED_COLOR_ID_VIOLET,=0D
>      Yellow =3D bindings::LED_COLOR_ID_YELLOW,=0D
>      Ir =3D bindings::LED_COLOR_ID_IR,=0D
> +    #[cfg_attr(=0D
> +        CONFIG_LEDS_CLASS_MULTICOLOR,=0D
> +        doc =3D "Use this color for a [`MultiColor`] led."=0D
> +    )]=0D
> +    #[cfg_attr(=0D
> +        not(CONFIG_LEDS_CLASS_MULTICOLOR),=0D
> +        doc =3D "Use this color for a `MultiColor` led."=0D
> +    )]=0D
> +    /// If the led supports RGB, use [`Color::Rgb`] instead.=0D
>      Multi =3D bindings::LED_COLOR_ID_MULTI,=0D
> +    #[cfg_attr(=0D
> +        CONFIG_LEDS_CLASS_MULTICOLOR,=0D
> +        doc =3D "Use this color for a [`MultiColor`] led with rgb suppor=
t."=0D
> +    )]=0D
> +    #[cfg_attr(=0D
> +        not(CONFIG_LEDS_CLASS_MULTICOLOR),=0D
> +        doc =3D "Use this color for a `MultiColor` led with rgb support.=
"=0D
> +    )]=0D
>      Rgb =3D bindings::LED_COLOR_ID_RGB,=0D
>      Purple =3D bindings::LED_COLOR_ID_PURPLE,=0D
>      Orange =3D bindings::LED_COLOR_ID_ORANGE,=0D
> @@ -296,7 +321,14 @@ fn try_from(value: u32) -> core::result::Result<Self=
, Self::Error> {=0D
>  ///=0D
>  /// Each led mode has its own led class device type with different capab=
ilities.=0D
>  ///=0D
> -/// See [`Normal`].=0D
> +#[cfg_attr(=0D
> +    CONFIG_LEDS_CLASS_MULTICOLOR,=0D
> +    doc =3D "See [`Normal`] and [`MultiColor`]."=0D
> +)]=0D
> +#[cfg_attr(=0D
> +    not(CONFIG_LEDS_CLASS_MULTICOLOR),=0D
> +    doc =3D "See [`Normal`] and `MultiColor`."=0D
> +)]=0D
>  pub trait Mode: private::Sealed {=0D
>      /// The class device for the led mode.=0D
>      type Device<'bound, T: LedOps<Mode =3D Self> + 'bound>;=0D
> diff --git a/rust/kernel/led/multicolor.rs b/rust/kernel/led/multicolor.r=
s=0D
> new file mode 100644=0D
> index 000000000000..18c9d36221f1=0D
> --- /dev/null=0D
> +++ b/rust/kernel/led/multicolor.rs=0D
> @@ -0,0 +1,405 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +//! Led mode for the `struct led_classdev_mc`.=0D
> +//!=0D
> +//! C header: [`include/linux/led-class-multicolor.h`](srctree/include/l=
inux/led-class-multicolor.h)=0D
> +=0D
> +use crate::{=0D
> +    alloc::KVec,=0D
> +    types::ScopeGuard, //=0D
> +};=0D
> +=0D
> +use super::*;=0D
> +=0D
> +/// The led mode for the `struct led_classdev_mc`. Leds with this mode c=
an have multiple colors.=0D
> +pub enum MultiColor {}=0D
> +impl Mode for MultiColor {=0D
> +    type Device<'bound, T: LedOps<Mode =3D Self> + 'bound> =3D MultiColo=
rDevice<'bound, T>;=0D
> +}=0D
> +impl private::Sealed for MultiColor {}=0D
> +=0D
> +/// The multicolor sub led info representation.=0D
> +///=0D
> +/// This structure represents the Rust abstraction for a C `struct mc_su=
bled`.=0D
> +#[repr(C)]=0D
> +#[derive(Copy, Clone, Debug)]=0D
> +#[non_exhaustive]=0D
> +pub struct MultiColorSubLed {=0D
> +    /// the color of the sub led=0D
> +    pub color: Color,=0D
> +    /// the brightness of the sub led.=0D
> +    ///=0D
> +    /// The value will be automatically calculated.=0D
> +    /// See `MultiColor::pre_brightness_set`.=0D
> +    pub brightness: u32,=0D
> +    /// the intensity of the sub led.=0D
> +    pub intensity: u32,=0D
> +    /// arbitrary data for the driver to store.=0D
> +    pub channel: u32,=0D
> +}=0D
> +=0D
> +// We directly pass a reference to the `subled_info` field in `led_class=
dev_mc` to the driver via=0D
> +// `Device::subleds()`.=0D
> +// We need safeguards to ensure `MultiColorSubLed` and `mc_subled` stay =
identical.=0D
> +const _: () =3D {=0D
> +    use core::mem::offset_of;=0D
> +=0D
> +    const fn assert_same_type<T>(_: &T, _: &T) {}=0D
> +=0D
> +    let rust_zeroed =3D MultiColorSubLed {=0D
> +        color: Color::White,=0D
> +        brightness: 0,=0D
> +        intensity: 0,=0D
> +        channel: 0,=0D
> +    };=0D
> +    let c_zeroed =3D bindings::mc_subled {=0D
> +        color_index: 0,=0D
> +        brightness: 0,=0D
> +        intensity: 0,=0D
> +        channel: 0,=0D
> +    };=0D
> +=0D
> +    assert!(offset_of!(MultiColorSubLed, color) =3D=3D offset_of!(bindin=
gs::mc_subled, color_index));=0D
> +    assert_same_type(&0u32, &c_zeroed.color_index);=0D
> +=0D
> +    assert!(=0D
> +        offset_of!(MultiColorSubLed, brightness) =3D=3D offset_of!(bindi=
ngs::mc_subled, brightness)=0D
> +    );=0D
> +    assert_same_type(&rust_zeroed.brightness, &c_zeroed.brightness);=0D
> +=0D
> +    assert!(offset_of!(MultiColorSubLed, intensity) =3D=3D offset_of!(bi=
ndings::mc_subled, intensity));=0D
> +    assert_same_type(&rust_zeroed.intensity, &c_zeroed.intensity);=0D
> +=0D
> +    assert!(offset_of!(MultiColorSubLed, channel) =3D=3D offset_of!(bind=
ings::mc_subled, channel));=0D
> +    assert_same_type(&rust_zeroed.channel, &c_zeroed.channel);=0D
> +=0D
> +    assert!(size_of::<MultiColorSubLed>() =3D=3D size_of::<bindings::mc_=
subled>());=0D
> +};=0D
> +=0D
> +impl MultiColorSubLed {=0D
> +    /// Create a new multicolor sub led info.=0D
> +    #[inline]=0D
> +    pub const fn new(color: Color) -> Self {=0D
> +        Self {=0D
> +            color,=0D
> +            brightness: 0,=0D
> +            intensity: 0,=0D
> +            channel: 0,=0D
> +        }=0D
> +    }=0D
> +=0D
> +    /// Set arbitrary data for the driver.=0D
> +    #[inline]=0D
> +    pub const fn channel(mut self, channel: u32) -> Self {=0D
> +        self.channel =3D channel;=0D
> +        self=0D
> +    }=0D
> +=0D
> +    /// Set the initial intensity of the subled.=0D
> +    #[inline]=0D
> +    pub const fn initial_intensity(mut self, intensity: u32) -> Self {=0D
> +        self.intensity =3D intensity;=0D
> +        self=0D
> +    }=0D
> +}=0D
> +=0D
> +/// The multicolor led class device representation.=0D
> +///=0D
> +/// This structure represents the Rust abstraction for a multicolor led =
class device.=0D
> +#[pin_data(PinnedDrop)]=0D
> +pub struct MultiColorDevice<'bound, T: LedOps<Mode =3D MultiColor> + 'bo=
und> {=0D
> +    #[pin]=0D
> +    ops: T,=0D
> +    #[pin]=0D
> +    classdev: Opaque<bindings::led_classdev_mc>,=0D
> +    _p: PhantomData<&'bound ()>,=0D
> +}=0D
> +=0D
> +impl<'a, S: DeviceBuilderState> DeviceBuilder<'a, S> {=0D
> +    /// Registers a new [`MulticolorDevice`].=0D
> +    pub fn build_multicolor<'bound: 'a, T: LedOps<Mode =3D MultiColor> +=
 'bound>(=0D
> +        self,=0D
> +        parent: &'bound T::Bus,=0D
> +        ops: impl PinInit<T, Error> + 'a,=0D
> +        subleds: &'a [MultiColorSubLed],=0D
> +    ) -> impl PinInit<MultiColorDevice<'bound, T>, Error> + 'a {=0D
> +        const_assert!(T::MAX_BRIGHTNESS <=3D i32::MAX.unsigned_abs() || =
!T::HAS_BRIGHTNESS_GET);=0D
> +=0D
> +        try_pin_init!(MultiColorDevice {=0D
> +            ops <- ops,=0D
> +            classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_cl=
assdev_mc| {=0D
> +                for (index_a, subled_a) in subleds.iter().enumerate() {=
=0D
> +                    for (index_b, subled_b) in subleds.iter().enumerate(=
) {=0D
> +                        if index_a !=3D index_b && subled_a.color =3D=3D=
 subled_b.color {=0D
> +                            dev_err!(parent.as_ref(), "duplicate color i=
n multicolor led\n");=0D
> +                            return Err(EINVAL);=0D
=0D
If we are failing on the first duplicate color then we can easily avoid O(n=
2)=0D
here.=0D
=0D
Instead of doing that, what I would do is:=0D
=0D
	let mut list =3D [false; LED_COLOR_ID_MAX as usize];=0D
	for subled in subleds {=0D
		if list[subled.color as usize] {=0D
			// duplication found, fail here.=0D
		}=0D
=0D
		list[subled.color as usize] =3D true;=0D
	}=0D
=0D
I know that we only have 15 colors today (I don't know if it that list ever=
=0D
grows) but I think we should always avoid landing that kind of *potentially=
*=0D
resource exhausting flows to kernel no matter how large/small the input is.=
=0D
I think it's just not a good practice.=0D
=0D
The latter should also be easier to read/follow at a glance.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> +                        }=0D
> +                    }=0D
> +                }=0D
> +                let mut subleds_vec =3D KVec::new();=0D
> +                subleds_vec.extend_from_slice(subleds, GFP_KERNEL)?;=0D
> +                let (subled_info, num_colors, capacity) =3D subleds_vec.=
into_raw_parts();=0D
> +                debug_assert_eq!(num_colors, capacity);=0D
> +=0D
> +                let subled_guard =3D ScopeGuard::new(|| {=0D
> +                    // SAFETY: `subled_info` is guaranteed to be a valid=
 array pointer to=0D
> +                    // `mc_subled` with the length and capacity of `num_=
colors`.=0D
> +                    drop(unsafe { KVec::from_raw_parts(subled_info, num_=
colors, num_colors) });=0D
> +                });=0D
> +=0D
> +                // SAFETY: `try_ffi_init` guarantees that `ptr` is valid=
 for write.=0D
> +                // `led_classdev_mc` gets fully initialized in-place by=
=0D
> +                // `led_classdev_multicolor_register_ext` including `mut=
ex` and `list_head`.=0D
> +                unsafe {=0D
> +                    ptr.write(bindings::led_classdev_mc {=0D
> +                        led_cdev: bindings::led_classdev {=0D
> +                            brightness_set: (!T::BLOCKING)=0D
> +                                .then_some(Adapter::<T>::brightness_set_=
callback),=0D
> +                            brightness_set_blocking: T::BLOCKING=0D
> +                                .then_some(Adapter::<T>::brightness_set_=
blocking_callback),=0D
> +                            brightness_get: T::HAS_BRIGHTNESS_GET=0D
> +                                .then_some(Adapter::<T>::brightness_get_=
callback),=0D
> +                            blink_set: T::HAS_BLINK_SET=0D
> +                                .then_some(Adapter::<T>::blink_set_callb=
ack),=0D
> +                            max_brightness: T::MAX_BRIGHTNESS,=0D
> +                            brightness: self.initial_brightness,=0D
> +                            color: self.color as u32,=0D
> +                            name: self.name.map_or(core::ptr::null(), CS=
trExt::as_char_ptr),=0D
> +                            ..bindings::led_classdev::default()=0D
> +                        },=0D
> +                        num_colors: u32::try_from(num_colors)?,=0D
> +                        // CAST: The safeguards in the const block ensur=
e that=0D
> +                        // `MultiColorSubLed` has an identical layout to=
 `mc_subled`.=0D
> +                        subled_info: subled_info.cast::<bindings::mc_sub=
led>(),=0D
> +                    })=0D
> +                };=0D
> +=0D
> +                let mut init_data =3D bindings::led_init_data {=0D
> +                    fwnode: self=0D
> +                        .fwnode=0D
> +                        .as_ref()=0D
> +                        .map_or(core::ptr::null_mut(), |fwnode| fwnode.a=
s_raw()),=0D
> +                    default_label: core::ptr::null(),=0D
> +                    devicename: self=0D
> +                        .devicename=0D
> +                        .map_or(core::ptr::null(), CStrExt::as_char_ptr)=
,=0D
> +                    devname_mandatory: self.devname_mandatory,=0D
> +                };=0D
> +=0D
> +                // SAFETY:=0D
> +                // - `parent.as_ref().as_raw()` is guaranteed to be a po=
inter to a valid=0D
> +                //    `device`.=0D
> +                // - `ptr` is guaranteed to be a pointer to an initializ=
ed `led_classdev_mc`.=0D
> +                to_result(unsafe {=0D
> +                    bindings::led_classdev_multicolor_register_ext(=0D
> +                        parent.as_ref().as_raw(),=0D
> +                        ptr,=0D
> +                        if self.name.is_none() {=0D
> +                            &raw mut init_data=0D
> +                        } else {=0D
> +                            core::ptr::null_mut()=0D
> +                        },=0D
> +                    )=0D
> +                })?;=0D
> +=0D
> +                subled_guard.dismiss();=0D
> +=0D
> +                core::mem::forget(self.fwnode); // keep the reference co=
unt incremented=0D
> +=0D
> +                Ok::<_, Error>(())=0D
> +            }),=0D
> +            _p: PhantomData,=0D
> +        })=0D
> +    }=0D
> +}=0D
> +=0D
> +impl<'bound, T: LedOps<Mode =3D MultiColor> + 'bound> MultiColorDevice<'=
bound, T> {=0D
> +    /// # Safety=0D
> +    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded =
within a=0D
> +    /// `led::MultiColorDevice`.=0D
> +    unsafe fn from_raw<'a>(led_cdev: *mut bindings::led_classdev) -> &'a=
 Self {=0D
> +        // SAFETY: The function's contract guarantees that `led_cdev` po=
ints to a `led_classdev`=0D
> +        // field embedded within a valid `led::MultiColorDevice`. `conta=
iner_of!` can therefore=0D
> +        // safely calculate the address of the containing struct.=0D
> +        let led_mc_cdev =3D unsafe { container_of!(led_cdev, bindings::l=
ed_classdev_mc, led_cdev) };=0D
> +=0D
> +        // SAFETY: It is guaranteed that `led_mc_cdev` points to a `led_=
classdev_mc`=0D
> +        // field embedded within a valid `led::MultiColorDevice`. `conta=
iner_of!` can therefore=0D
> +        // safely calculate the address of the containing struct.=0D
> +        unsafe { &*container_of!(Opaque::cast_from(led_mc_cdev), Self, c=
lassdev) }=0D
> +    }=0D
> +=0D
> +    #[inline]=0D
> +    fn parent(&self) -> &'bound device::Device<Bound> {=0D
> +        // SAFETY: `self.classdev.get()` is guaranteed to be a valid poi=
nter to `led_classdev_mc`.=0D
> +        unsafe { device::Device::from_raw((*(*self.classdev.get()).led_c=
dev.dev).parent) }=0D
> +    }=0D
> +=0D
> +    /// Returns the subleds passed to [`Device::new_multicolor`].=0D
> +    #[inline]=0D
> +    pub fn subleds(&self) -> &[MultiColorSubLed] {=0D
> +        // SAFETY: The existence of `self` guarantees that `self.classde=
v.get()` is a pointer to a=0D
> +        // valid `led_classdev_mc`.=0D
> +        let raw =3D unsafe { &*self.classdev.get() };=0D
> +        // SAFETY: `raw.subled_info` is a valid pointer to `mc_subled[nu=
m_colors]`.=0D
> +        // CAST: The safeguards in the const block ensure that `MultiCol=
orSubLed` has an identical=0D
> +        // layout to `mc_subled`.=0D
> +        unsafe {=0D
> +            core::slice::from_raw_parts(=0D
> +                raw.subled_info.cast::<MultiColorSubLed>(),=0D
> +                // CAST: It is guaranteed that `num_colors` fits into an=
 `usize`.=0D
> +                raw.num_colors as usize,=0D
> +            )=0D
> +        }=0D
> +    }=0D
> +}=0D
> +=0D
> +// SAFETY: A `led::MultiColorDevice` can be unregistered from any thread=
.=0D
> +unsafe impl<'bound, T: LedOps<Mode =3D MultiColor> + 'bound + Send> Send=
=0D
> +    for MultiColorDevice<'bound, T>=0D
> +{=0D
> +}=0D
> +=0D
> +// SAFETY: `led::MultiColorDevice` can be shared among threads because a=
ll methods of `led::Device`=0D
> +// are thread safe.=0D
> +unsafe impl<'bound, T: LedOps<Mode =3D MultiColor> + 'bound + Sync> Sync=
=0D
> +    for MultiColorDevice<'bound, T>=0D
> +{=0D
> +}=0D
> +=0D
> +struct Adapter<T: LedOps<Mode =3D MultiColor>> {=0D
> +    _p: PhantomData<T>,=0D
> +}=0D
> +=0D
> +impl<T: LedOps<Mode =3D MultiColor>> Adapter<T> {=0D
> +    /// # Safety=0D
> +    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded =
within a=0D
> +    /// `led::MultiColorDevice`.=0D
> +    /// This function is called on setting the brightness of a led.=0D
> +    unsafe extern "C" fn brightness_set_callback(=0D
> +        led_cdev: *mut bindings::led_classdev,=0D
> +        brightness: u32,=0D
> +    ) {=0D
> +        // SAFETY: The function's contract guarantees that `led_cdev` is=
 a valid pointer to a=0D
> +        // `led_classdev` embedded within a `led::MultiColorDevice`.=0D
> +        let classdev =3D unsafe { MultiColorDevice::<T>::from_raw(led_cd=
ev) };=0D
> +        // SAFETY: `classdev.parent()` is guaranteed to be contained in =
`T::Bus`.=0D
> +        let parent =3D unsafe { T::Bus::from_device(classdev.parent()) }=
;=0D
> +=0D
> +        // SAFETY: `classdev.classdev.get()` is guaranteed to be a point=
er to a valid=0D
> +        // `led_classdev_mc`.=0D
> +        unsafe { bindings::led_mc_calc_color_components(classdev.classde=
v.get(), brightness) };=0D
> +=0D
> +        let _ =3D classdev.ops.brightness_set(parent, classdev, brightne=
ss);=0D
> +    }=0D
> +=0D
> +    /// # Safety=0D
> +    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded =
within a=0D
> +    /// `led::MultiColorDevice`.=0D
> +    /// This function is called on setting the brightness of a led immed=
iately.=0D
> +    unsafe extern "C" fn brightness_set_blocking_callback(=0D
> +        led_cdev: *mut bindings::led_classdev,=0D
> +        brightness: u32,=0D
> +    ) -> i32 {=0D
> +        from_result(|| {=0D
> +            // SAFETY: The function's contract guarantees that `led_cdev=
` is a valid pointer to a=0D
> +            // `led_classdev` embedded within a `led::MultiColorDevice`.=
=0D
> +            let classdev =3D unsafe { MultiColorDevice::<T>::from_raw(le=
d_cdev) };=0D
> +            // SAFETY: `classdev.parent()` is guaranteed to be contained=
 in `T::Bus`.=0D
> +            let parent =3D unsafe { T::Bus::from_device(classdev.parent(=
)) };=0D
> +=0D
> +            // SAFETY: `classdev.classdev.get()` is guaranteed to be a p=
ointer to a valid=0D
> +            // `led_classdev_mc`.=0D
> +            unsafe { bindings::led_mc_calc_color_components(classdev.cla=
ssdev.get(), brightness) };=0D
> +=0D
> +            classdev.ops.brightness_set(parent, classdev, brightness)?;=
=0D
> +            Ok(0)=0D
> +        })=0D
> +    }=0D
> +=0D
> +    /// # Safety=0D
> +    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded =
within a=0D
> +    /// `led::MultiColorDevice`.=0D
> +    /// This function is called on getting the brightness of a led.=0D
> +    unsafe extern "C" fn brightness_get_callback(led_cdev: *mut bindings=
::led_classdev) -> u32 {=0D
> +        // SAFETY: The function's contract guarantees that `led_cdev` is=
 a valid pointer to a=0D
> +        // `led_classdev` embedded within a `led::MultiColorDevice`.=0D
> +        let classdev =3D unsafe { MultiColorDevice::<T>::from_raw(led_cd=
ev) };=0D
> +        // SAFETY: `classdev.parent()` is guaranteed to be contained in =
`T::Bus`.=0D
> +        let parent =3D unsafe { T::Bus::from_device(classdev.parent()) }=
;=0D
> +=0D
> +        // CAST: Resulting value will be casted back to i32 in the led s=
ubsystem.=0D
> +        from_result(|| {=0D
> +            classdev=0D
> +                .ops=0D
> +                .brightness_get(parent, classdev)=0D
> +                .inspect(|val| debug_assert!(*val <=3D T::MAX_BRIGHTNESS=
))=0D
> +                .and_then(|val| Ok(i32::try_from(val)?))=0D
> +        }) as u32=0D
> +    }=0D
> +=0D
> +    /// # Safety=0D
> +    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded =
within a=0D
> +    /// `led::MultiColorDevice`.=0D
> +    /// `delay_on` and `delay_off` must be valid pointers to `usize` and=
 have=0D
> +    /// exclusive access for the period of this function.=0D
> +    /// This function is called on enabling hardware accelerated blinkin=
g.=0D
> +    unsafe extern "C" fn blink_set_callback(=0D
> +        led_cdev: *mut bindings::led_classdev,=0D
> +        delay_on: *mut usize,=0D
> +        delay_off: *mut usize,=0D
> +    ) -> i32 {=0D
> +        from_result(|| {=0D
> +            // SAFETY: The function's contract guarantees that `led_cdev=
` is a valid pointer to a=0D
> +            // `led_classdev` embedded within a `led::MultiColorDevice`.=
=0D
> +            let classdev =3D unsafe { MultiColorDevice::<T>::from_raw(le=
d_cdev) };=0D
> +            // SAFETY: `classdev.parent()` is guaranteed to be contained=
 in `T::Bus`.=0D
> +            let parent =3D unsafe { T::Bus::from_device(classdev.parent(=
)) };=0D
> +=0D
> +            classdev.ops.blink_set(=0D
> +                parent,=0D
> +                classdev,=0D
> +                // SAFETY: The function's contract guarantees that `dela=
y_on` points to a `usize`=0D
> +                // and is exclusive for the period of this function.=0D
> +                unsafe { &mut *delay_on },=0D
> +                // SAFETY: The function's contract guarantees that `dela=
y_off` points to a `usize`=0D
> +                // and is exclusive for the period of this function.=0D
> +                unsafe { &mut *delay_off },=0D
> +            )?;=0D
> +            Ok(0)=0D
> +        })=0D
> +    }=0D
> +}=0D
> +=0D
> +#[pinned_drop]=0D
> +impl<'bound, T: LedOps<Mode =3D MultiColor> + 'bound> PinnedDrop for Mul=
tiColorDevice<'bound, T> {=0D
> +    fn drop(self: Pin<&mut Self>) {=0D
> +        let raw =3D self.classdev.get();=0D
> +        // SAFETY: The existence of `self` guarantees that `self.classde=
v.get()` is a pointer to a=0D
> +        // valid `led_classdev_mc`.=0D
> +        let dev: &device::Device =3D unsafe { device::Device::from_raw((=
*raw).led_cdev.dev) };=0D
> +=0D
> +        let _fwnode =3D dev=0D
> +            .fwnode()=0D
> +            // SAFETY: the reference count of `fwnode` has previously be=
en=0D
> +            // incremented in `led::Device::new`.=0D
> +            .map(|fwnode| unsafe { ARef::from_raw(NonNull::from(fwnode))=
 });=0D
> +=0D
> +        // SAFETY: The existence of `self` guarantees that `self.classde=
v` has previously been=0D
> +        // successfully registered with `led_classdev_multicolor_registe=
r_ext`.=0D
> +        unsafe { bindings::led_classdev_multicolor_unregister(raw) };=0D
> +=0D
> +        // SAFETY: `raw` is guaranteed to be a valid pointer to `led_cla=
ssdev_mc`.=0D
> +        let led_cdev =3D unsafe { &*raw };=0D
> +=0D
> +        // SAFETY: `subled_info` is guaranteed to be a valid array point=
er to `mc_subled` with the=0D
> +        // length and capacity of `led_cdev.num_colors`. See `led::Multi=
colorDevice::new`.=0D
> +        drop(unsafe {=0D
> +            KVec::from_raw_parts(=0D
> +                led_cdev.subled_info,=0D
> +                led_cdev.num_colors as usize,=0D
> +                led_cdev.num_colors as usize,=0D
> +            )=0D
> +        });=0D
> +    }=0D
> +}=0D
> =0D
> -- =0D
> 2.53.0=0D
> =0D

