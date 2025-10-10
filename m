Return-Path: <linux-leds+bounces-5727-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B22E6BCE436
	for <lists+linux-leds@lfdr.de>; Fri, 10 Oct 2025 20:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 617D84E2C2C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Oct 2025 18:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586DD26E714;
	Fri, 10 Oct 2025 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIvthomQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03120ADD6;
	Fri, 10 Oct 2025 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760121394; cv=none; b=tN+q3NfQ2IoyLofnSmi9uWGHZYNs6fQLC5bnvxN4Y8aswV92JvKdvSnDHnmIjjjZxtdrLySkAq1UJC/9MpN5A5A8uiktX6nL9ukI72Zvyy9Ngnlu6giUrhgwopvjgI7pvfvmS2ftH/SeGNWrJ36OkuPGmVT9agUyoR23ICfkdlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760121394; c=relaxed/simple;
	bh=0d23nITmragJ2EOxqTsvZ6bKKUTCo9RRSpL0qcqnsBI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sHemkgrZPLNcHV+rPjHrnrTXt/x7yruJxHoWdYwPzxl8/BNG2fa0Ack0McW1bhIeeRvINTGh2eOh3/Y4gC+dUGwsqYrjtJlA867X0klXWK89FPzpHnzvY98WxZPt1f1TV4mesdv0xxGynnZxxL37K25zOBM259DCkJDzlKjo0Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIvthomQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15058C4CEF1;
	Fri, 10 Oct 2025 18:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760121393;
	bh=0d23nITmragJ2EOxqTsvZ6bKKUTCo9RRSpL0qcqnsBI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=LIvthomQNLEKLQGjtchwt2oL06l90lNeySupVhvDdmEDjYAs+1nhwq+oJqP5Honnm
	 Dh9QVHBpSAdsyl/TcJgmkdMmr+i4HBQcoLnKpH/hWO+ROklYC9hyK3rjTqJA3taynS
	 uWo2v6f49d6YEBgqyJhO9TBARfjXisN/jl8cGoqdf6OCHQrscgFuYLhtmnJhYZ3ga0
	 IFo910v+RH/kAyAojuNhS0sNUp4q7sJc5aDaWb+pJ4X6tKd4iGIcMGp6LI6CDtcYFH
	 y1jwJ94JSuCi+cTjl1haC7XYpGsE4vzAIvyqdhQjcCUjaXXzaH7uxmPkRtHxBiRJaW
	 7C+a0EAwVZqDw==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 20:36:28 +0200
Message-Id: <DDEUYJ3RLBO0.3BI35RYL7OUU6@kernel.org>
Subject: Re: [PATCH 2/2] rust: leds: add basic led classdev abstractions
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Lee Jones" <lee@kernel.org>, "Pavel Machek"
 <pavel@kernel.org>, "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251009170739.235221-1-markus.probst@posteo.de>
 <20251009170739.235221-3-markus.probst@posteo.de>
In-Reply-To: <20251009170739.235221-3-markus.probst@posteo.de>

On Thu Oct 9, 2025 at 7:07 PM CEST, Markus Probst wrote:
> +/// The led class device representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct led_c=
lassdev`.
> +#[pin_data(PinnedDrop)]
> +pub struct Device {
> +    handler: KBox<dyn HandlerImpl>,

The corresponding callbacks already exist in struct led_classdev, please us=
e
them instead.

> +    #[pin]
> +    classdev: Opaque<bindings::led_classdev>,
> +}

<snip>

> +// SAFETY: A `led::Device` can be unregistered from any thread.
> +unsafe impl Send for Device {}
> +
> +// SAFETY: `led::Device` can be shared among threads because all methods=
 of `led::Device`
> +// are thread safe.
> +unsafe impl Sync for Device {}
> +
> +impl Device {
> +    /// Registers a new led classdev.
> +    ///
> +    /// The [`Device`] will be unregistered and drop.
> +    pub fn new<'a, T: Handler + 'static>(
> +        parent: Option<&'a device::Device>,

This should not be an Option, all LED devices should have a parent (bus) de=
vice.

Also, it should be a &Device<Bound>, i.e. a device that is guaranteed to be
bound to a driver.

> +        init_data: InitData<'a>,
> +        handler: T,
> +    ) -> impl PinInit<Self, Error> + use<'a, T> {

This will not compile for all supported compiler versions. For now it just =
has
to be:

	impl PinInit<Self, Error> + 'a

Besides that, this should return impl PinInit<Devres<Self>, Error> + 'a ins=
tead.
This will allow you to let callbacks, such as blink_set(), to provide the p=
arent
device as &Device<Bound>.

Please see also the PWM abstractions for reference [1]. There's one differe=
nce between
LED and PWM though. Unlike PWM (and most other class device implementations=
) LED
combines initialization and registration of the device, hence PWM is slight=
ly
different in its implementation details, but semantically it's the same.

[1] https://lore.kernel.org/all/20250930-rust-next-pwm-working-fan-for-send=
ing-v15-3-5661c3090877@samsung.com/

> +        try_pin_init!(Self {
> +            handler <- {
> +                let handler: KBox<dyn HandlerImpl> =3D KBox::<T>::new(ha=
ndler, GFP_KERNEL)?;
> +                Ok::<_, Error>(handler)
> +            },
> +            classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_cl=
assdev| {
> +                // SAFETY: `try_ffi_init` guarantees that `ptr` is valid=
 for write.
> +                unsafe { ptr.write(bindings::led_classdev {

This looks very odd at a first glance, but it is indeed correct. It would b=
e
good to add a comment that the parts of struct led_classdev that need to be
initialized in place (e.g. the struct mutex and struct list_head) are
initialized by led_classdev_register_ext() (which is not exactly straight
forward).

> +                    max_brightness: T::MAX_BRIGHTNESS,
> +                    brightness_set: T::BLOCKING.then_some(
> +                        brightness_set as unsafe extern "C" fn(*mut bind=
ings::led_classdev, u32)
> +                    ),
> +                    brightness_set_blocking: (!T::BLOCKING).then_some(
> +                        brightness_set_blocking
> +                            as unsafe extern "C" fn(*mut bindings::led_c=
lassdev,u32) -> i32
> +                    ),
> +                    blink_set: T::BLINK.then_some(
> +                        blink_set
> +                            as unsafe extern "C" fn(*mut bindings::led_c=
lassdev, *mut usize,
> +                                                    *mut usize) -> i32
> +                    ),
> +                    .. bindings::led_classdev::default()
> +                }) };
> +
> +                let mut init_data =3D bindings::led_init_data {
> +                    fwnode: init_data.fwnode.map_or(core::ptr::null_mut(=
), FwNode::as_raw),
> +                    default_label: init_data.default_label
> +                                            .map_or(core::ptr::null(), C=
Str::as_char_ptr),
> +                    devicename: init_data.devicename.map_or(core::ptr::n=
ull(), CStr::as_char_ptr),
> +                    devname_mandatory: init_data.devname_mandatory,
> +                };
> +
> +                let parent =3D parent
> +                    .map_or(core::ptr::null_mut(), device::Device::as_ra=
w);
> +
> +                // SAFETY:
> +                // - `parent` is guaranteed to be a pointer to a valid `=
device`
> +                //    or a null pointer.
> +                // - `ptr` is guaranteed to be a pointer to an initializ=
ed `led_classdev`.
> +                to_result(unsafe {
> +                    bindings::led_classdev_register_ext(parent, ptr, &mu=
t init_data)
> +                })
> +            }),
> +        })
> +    }
> +}

