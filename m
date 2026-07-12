Return-Path: <linux-leds+bounces-9049-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JfqAAg7SU2orfQMAu9opvQ
	(envelope-from <linux-leds+bounces-9049-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:42:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B65745834
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:42:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HRoLogRf;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9049-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9049-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF33930097D4
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 17:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414F526982C;
	Sun, 12 Jul 2026 17:42:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4E241CB7;
	Sun, 12 Jul 2026 17:42:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878155; cv=none; b=OOMdHG/JPv7fEZsFof4ZxginsrWWtzNep1pPQcYrKhG3+BZxKFnwps0sWQu5vFa46y4R1FjiY15liGSoeLA8WGiXncN3TemMF91On0Yxi9OM8MZDA0Wo+EyXM3ykdnUluWDCZNJxTfsWMgLD32aIR/Hyd+OUOeeV/i8esUg8csk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878155; c=relaxed/simple;
	bh=XXSmvUqKYkjxJW5RdcI+U+ckwNWBEWNVYPSU+ZRdKME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K1R3Nm3XMzm8Gsj0O1XiTFvDDH7ksKiZJtIB89lktFu6NvuYgYOgdef4UhXuR+6KlMgy3cs7bbNu6iVrMgB+Ie/PdNH5/98aICxd5TyL+h+SGfJxC6rpfmw06Il0RQL6rDOnxutU9FUT+ZlcJKIf6KrP3TY8lWTS54ALFue4PVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRoLogRf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D17E1F000E9;
	Sun, 12 Jul 2026 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783878153;
	bh=hhJACipbEfiF13bfNQ0EewP0VVo5SoqJbX4Ev8wBfDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HRoLogRfJas+fQU3peoSSrNlvWHIjC1EH5ylrXUvm0b3ar7Taplgga9X6WBEY5UYx
	 NHCIqAVfZk0x/YrVRZ/F9KT7VG+NazRLSUViTpe/36IiuAW4N2weZ9IKArcSESNQSH
	 ou8vj9PWMJTgpy3WYQ4C+mzLjxRiTG8Rb5Zv3tAy44rKXGn8rhgwQSp7Nz9T/PLTF8
	 NBsdZ2DCXv2VG+qTWz4Mp4u2k+EkTaVDCy2XDPhInf6n+A3u9hQyRL8mFAvoMdWJWk
	 fefs8uBYdVZmgQkjmq0M3TeQhxBizSn4ujgcnOqRAbdMWSEQkaPMB2gWO7rP+NR580
	 cfuukuNGDnhtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 1/3] rust: leds: add basic led classdev abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: ojeda@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, linux-pci@vger.kernel.org
In-Reply-To: <20260712-rust_leds-v22-1-055b0459a079@posteo.de>
References: <20260712-rust_leds-v22-0-055b0459a079@posteo.de>
 <20260712-rust_leds-v22-1-055b0459a079@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 17:42:32 +0000
Message-Id: <20260712174233.5D17E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9049-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:ojeda@kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21B65745834

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The firmware node reference is insecurely tracked by assuming the =
C layer's `dev->fwnode` field remains unmodified, which can lead to referen=
ce count underflow, use-after-free, or memory leaks.
- [Medium] The LED device is registered using the unmanaged `led_classdev_r=
egister_ext()` instead of the managed `devm_led_classdev_register_ext()`, v=
iolating subsystem lifecycle guidelines and introducing devres LIFO orderin=
g hazards.
--

--- Patch [1]: [PATCH v22 1/3] rust: leds: add basic led classdev abstracti=
ons ---
commit 7eff903565ff4a4fae9e842098053e60f2989206
Author: Markus Probst <markus.probst@posteo.de>

rust: leds: add basic led classdev abstractions

This commit introduces core abstractions for LED class devices in Rust. It
implements traits for handling LED operations, a device builder, and a safe
wrapper for led_classdev.

> diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
> index 0000000000000..816db7c576894
> --- /dev/null
> +++ b/rust/kernel/led/normal.rs

[ ... ]

> @@ -65,22 +65,22 @@ impl<'init, S: DeviceBuilderState> DeviceBuilder<'ini=
t, S> {
>                  // SAFETY:
>                  // - `parent.as_ref().as_raw()` is guaranteed to be a po=
inter to a valid
>                  //    `device`.
>                  // - `ptr` is guaranteed to be a pointer to an initializ=
ed `led_classdev`.
>                  to_result(unsafe {
>                      bindings::led_classdev_register_ext(

[Severity: Medium]
Does calling the unmanaged bindings::led_classdev_register_ext() instead of
the managed bindings::devm_led_classdev_register_ext() violate the LED
subsystem lifecycle guidelines?

Relying on manual PinnedDrop for unregistration appears to decouple the
device lifecycle from the C driver core's devres cleanup. Could this
introduce devres teardown ordering hazards, use-after-free, or resource
leaks if user-space sysfs attributes are accessed after device removal?

>                          parent.as_ref().as_raw(),
>                          ptr,
>                          if self.name.is_none() {
>                              &raw mut init_data
>                          } else {
>                              core::ptr::null_mut()
>                          },
>                      )
>                  })?;
> =20
>                  core::mem::forget(self.fwnode); // keep the reference co=
unt incremented

[Severity: High]
If the driver was built without an fwnode (where self.fwnode is None), but
the C layer assigns a node to dev->fwnode during the device's lifetime, will
dev.fwnode() return Some(fwnode) during unregistration?

It seems this would unconditionally create an ARef from this unowned pointer
and drop it, decrementing a reference count it never acquired.

Similarly, if the C layer replaces a previously provided node, could the
original node leak and the new node be improperly decremented?

> =20
>                  Ok::<_, Error>(())
>              }),
>              _p: PhantomData,
>          })
>      }
>  }

[ ... ]

> @@ -211,20 +211,20 @@ impl<T: LedOps> Adapter<T> {
>  #[pinned_drop]
>  impl<'bound, T: LedOps + 'bound> PinnedDrop for Device<'bound, T> {
>      fn drop(self: Pin<&mut Self>) {
>          let raw =3D self.classdev.get();
>          // SAFETY: The existence of `self` guarantees that `self.classde=
v.get()` is a pointer to a
>          // valid `led_classdev`.
>          let dev: &device::Device =3D unsafe { device::Device::from_raw((=
*raw).dev) };
> =20
>          let _fwnode =3D dev
>              .fwnode()
>              // SAFETY: the reference count of `fwnode` has previously be=
en
>              // incremented in `led::DeviceBuilder::build`.
>              .map(|fwnode| unsafe { ARef::from_raw(NonNull::from(fwnode))=
 });

[Severity: High]
As mentioned above, if the fwnode was dynamically assigned or replaced by t=
he
C layer, is it safe to unconditionally construct an ARef from the dev->fwno=
de
pointer here?

> =20
>          // SAFETY: The existence of `self` guarantees that `self.classde=
v` has previously been
>          // successfully registered with `led_classdev_register_ext`.
>          unsafe { bindings::led_classdev_unregister(raw) };

[Severity: Medium]
As asked earlier, could relying on manual unregistration here during Drop
break standard C-level devres lifecycle ordering?

>      }
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-rust_leds-=
v22-0-055b0459a079@posteo.de?part=3D1

