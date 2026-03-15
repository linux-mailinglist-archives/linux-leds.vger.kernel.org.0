Return-Path: <linux-leds+bounces-7350-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL/cL134tmlfLAEAu9opvQ
	(envelope-from <linux-leds+bounces-7350-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 19:20:13 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68564291E3E
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 19:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74DDD3013697
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 18:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A23D370D54;
	Sun, 15 Mar 2026 18:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7c4A8au"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDE82853E0;
	Sun, 15 Mar 2026 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773598809; cv=none; b=Gp1JBvQcKx8LNHvFRiPgcGuIzYiC3N+PnIYOaop5dxS0aBqq3LFz5Kj76LKR3z2ykx5BSE/891pksdpUFPIW/WazTa5DJHHK3e9vg2OcfZxhoFwbx3yvgKbWSqXuswRB8EyJSj8xpB8mL8IQ71wxdZPxZtdR3AJOL2F6Y52rk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773598809; c=relaxed/simple;
	bh=k5nmlFwR93uO29L3+t9OVb6SIgBdLQJt+42Hsj0MBCE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nobuZhrye7kRxgc4xd+iCNTSpSN5ftk53cmSNtGBjX2aRHypL/xeCh5Ugc5mXjxZzM82FD3WnXqlRmDD0BegbC74N2ixgklgbgJMMCzlovcF2PKAEflVjH72zGP2NdXvUPd8ELJCOOiobZ/hrgGstWoJFqbm33EYeoaaFnZn888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7c4A8au; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B904EC4CEF7;
	Sun, 15 Mar 2026 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773598808;
	bh=k5nmlFwR93uO29L3+t9OVb6SIgBdLQJt+42Hsj0MBCE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=N7c4A8aunkRAz3nkWaAbXMQq01jb9nENV9ky+1V888Cg/WYTL6CilzRtfj35GvntC
	 IOF/fhg4TwDCjd+s7yPma2fU35NwP0fjlp0TnwGD9pOwys22dRxYYdnd73QEOLTopb
	 ztiv2e2I3/vmMWNaz4tXGGkYC+kk3khyQ15bLwFIehXkiI+ylymK226fZBKkJaGgWq
	 606O43iKEOeT5SZRUvnrnAmdSoK+MpshsoOdfi2LjtfW+l2FVre50jH/lk1WsFA4sO
	 Wu/bd0kQoC3vFPct69uRmX4Cb24WCFqFeixzMItzccXn48H+gbf/viNWrQD2Utu6kE
	 raopReF1OrG5w==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 19:20:00 +0100
Message-Id: <DH3KAWWLECYW.3VBH7PIE7ZE20@kernel.org>
Subject: Re: [PATCH v3 7/7] leds: add synology microp led driver
Cc: "Markus Probst via B4 Relay"
 <devnull+markus.probst.posteo.de@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Igor Korotin" <igor.korotin.linux@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Len Brown"
 <lenb@kernel.org>, "Robert Moore" <robert.moore@intel.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <linux-leds@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>
To: "Markus Probst" <markus.probst@posteo.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
 <20260313-synology_microp_initial-v3-7-ad6ac463a201@posteo.de>
 <DH1YH0GO75H8.18YSW2VMKRB3C@kernel.org>
 <39f1c9bb0dbde9f1b60785f8e838289c888ffdb0.camel@posteo.de>
In-Reply-To: <39f1c9bb0dbde9f1b60785f8e838289c888ffdb0.camel@posteo.de>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7350-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,markus.probst.posteo.de,dt];
	RCPT_COUNT_TWELVE(0.00)[31];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 68564291E3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun Mar 15, 2026 at 4:15 PM CET, Markus Probst wrote:
> On Fri, 2026-03-13 at 22:00 +0100, Danilo Krummrich wrote:
>> On Fri Mar 13, 2026 at 8:03 PM CET, Markus Probst via B4 Relay wrote:
>> > +impl Command {
>> > +    fn write(self, dev: &platform::Device<Bound>) -> Result {
>> > +        // SAFETY: Since we have no of and no acpi match table, we as=
sume this is a mfd sub-device
>> > +        // and our parent is a serial device bus device, bound to the=
 synology microp core driver.
>> > +        let parent =3D unsafe { dev.as_ref().parent_unchecked::<serde=
v::Device<Bound>>() };
>>=20
>> Despite being accurate description, "assume" is not what you want to rea=
d for a
>> safety justification. :)
>>=20
>> We don't want to directly access the serial device from this driver. Ins=
tead,
>> there should be an abstraction layer of the resource you are accessing.
>>=20
>> If this would be I2C or SPI you would request the regmap of the parent a=
t this
>> point, e.g.
>>=20
>> 	dev.parent().regmap("led_registers")
>>=20
>> Now, this is a serial device, but regmap still works perfectly fine for =
this
>> case. It even allows you to ensure from the MFD driver to restrict the L=
ED
>> driver of sending commands that are not LED specific by exposing a LED s=
pecific
>> regmap. Additionally, if you need additional locking etc. it can all be =
done
>> within the regmap implementation, so you entirely avoid custom APIs.
>>=20
>> I'm not sure how common regmap is for serial devices to be honest, but
>> apparently there are drivers doing this and I don't really see a reason =
against
>> it.
>>=20
>> For instance, there is drivers/iio/imu/bno055/, which is a chip that wor=
ks on
>> both serial and I2C busses and fully abstracts this fact with regmap.
> How would this work with handling incoming data?
>
> For example, once the power button on the NAS device is pressed, the
> serdev device would receive a `0x30` byte.
>
> Regmap seems like it can only do read and write after it has been
> requested. No event handling.

That's orthogonal, directly accessing the struct serdev doesn't help with t=
his
either.

Isn't this handled through IRQs, i.e. you device issues an IRQ and then you=
 read
from the serial bus?

(I'm asking since such chips can usually be connected via different busses,=
 e.g.
serial and I2C. And with I2C the slave can't issue a transfer by itself.)

Other MFD drivers register their own IRQ chip for this. I.e. one would regi=
ster
an IRQ chip in the MFD driver and pass it to the sub-devices created throug=
h
mfd_add_devices(). Then the sub-device receives an IRQ and reads the regmap=
.

Now, if you don't have IRQs at all and the only event you get is through
receive_buf() (which implies that the chip is only compatible with a serial=
 bus)
this technically still works, but might be a bit overkill.

In this case, maybe a monolithic driver would even be better; no idea where=
 it
would live though.

>> In Rust a regmap will probably become a backend of the generic I/O
>> infrastructure we are working on, which will also allow you to use the
>> register!() infrastructure, etc.
>>=20
>> register!() and some other generic I/O improvements will land this cycle=
, I/O
>> projections are more likely to land next cycle.
>>=20
>> > +        parent.write_all(
>> > +            match self {
>> > +                Self::Power(State::On) =3D> &[0x34],
>> > +                Self::Power(State::Blink) =3D> &[0x35],
>> > +                Self::Power(State::Off) =3D> &[0x36],
>> > +
>> > +                Self::Status(_, State::Off) =3D> &[0x37],
>> > +                Self::Status(StatusLedColor::Green, State::On) =3D> &=
[0x38],
>> > +                Self::Status(StatusLedColor::Green, State::Blink) =3D=
> &[0x39],
>> > +                Self::Status(StatusLedColor::Orange, State::On) =3D> =
&[0x3A],
>> > +                Self::Status(StatusLedColor::Orange, State::Blink) =
=3D> &[0x3B],
>> > +
>> > +                Self::Alert(State::On) =3D> &[0x4C, 0x41, 0x31],
>> > +                Self::Alert(State::Blink) =3D> &[0x4C, 0x41, 0x32],
>> > +                Self::Alert(State::Off) =3D> &[0x4C, 0x41, 0x33],
>> > +
>> > +                Self::Usb(State::On) =3D> &[0x40],
>> > +                Self::Usb(State::Blink) =3D> &[0x41],
>> > +                Self::Usb(State::Off) =3D> &[0x42],
>> > +            },
>> > +            serdev::Timeout::Max,
>> > +        )?;
>> > +        Ok(())
>> > +    }
>> > +}


