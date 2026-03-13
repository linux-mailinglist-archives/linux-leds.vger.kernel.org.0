Return-Path: <linux-leds+bounces-7340-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKJ0IhV7tGmOogAAu9opvQ
	(envelope-from <linux-leds+bounces-7340-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 22:01:09 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC0D289FD5
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 22:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 414F5301C58C
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 21:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376A53806B2;
	Fri, 13 Mar 2026 21:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D60pN7n6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD3372ED0;
	Fri, 13 Mar 2026 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435662; cv=none; b=VK0gY1I+pu6WoD8bIuG/LLTPKopv5cGEzw2wzXMC4AynNK8CgJwwOEqigkigDlLcpi/fKtrWZXm2AVKDjIvpTqpx1GVKgfRiGc7l0rH6CZGTv/Lbfx1/8udYZqRdX7aZWABGZQxtrHo8hp478cN0Tq4l37TR+5tk/dqJnifpOWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435662; c=relaxed/simple;
	bh=O1nNclFDbyjxv8qi+UO7kEi9GWMfQEet1G/iJQKNSuc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=ZLcBVZjDCqqi6o1pE6N419bc32P7pvvn9rO7VwutpAIVp91iMYfCWeL5x8DZE37AplGu8J5fqNmY8Nn6q0jc6JlBcMWDOwwz1p2ezBa07q4q9ukZz8PTjxrsMH1+pvt5qNWT6Kp0dlxXLK9IwtdzYQ0ljpNgdaBRVMo9wf4V8GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D60pN7n6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7B6C19421;
	Fri, 13 Mar 2026 21:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773435661;
	bh=O1nNclFDbyjxv8qi+UO7kEi9GWMfQEet1G/iJQKNSuc=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=D60pN7n6xCiMmcp3DkouG5BJQPAqjLqpjWsWKm+eEugVKQ5TZldFQIJXq1h3YMsmi
	 tV83t/LH1xOh+B9DjVLiLJz8WxXP5EAk/RJVUk5gsVWhGIuL0mKQ6ZtcObZEmsfW8S
	 VHV2QBVE+7aYD277iItBjI/hI7Vvq4wr1ngLHgGp1vHD6oDjlT+hPFTw7SICS8Cbfr
	 pTAMPFLTsGCmuWuW2Xiqls+SP/2p1uX8tQgdRU1WOGvfcvWPoRMCdgvNyVvLfgcaUA
	 VJxGtsGL+nlgZDLchLAdeQKG2jmZ50CX8BXimDtnaClH0fuxKSOU4TOJWSkggs2VY8
	 2TiPAYz4wZ/EA==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 22:00:54 +0100
Message-Id: <DH1YH0GO75H8.18YSW2VMKRB3C@kernel.org>
To: "Markus Probst via B4 Relay"
 <devnull+markus.probst.posteo.de@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 7/7] leds: add synology microp led driver
Cc: <markus.probst@posteo.de>, "Lee Jones" <lee@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Igor Korotin"
 <igor.korotin.linux@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Pavel
 Machek" <pavel@kernel.org>, "Len Brown" <lenb@kernel.org>, "Robert Moore"
 <robert.moore@intel.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linux-pci@vger.kernel.org>,
 <linux-leds@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
 <acpica-devel@lists.linux.dev>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
 <20260313-synology_microp_initial-v3-7-ad6ac463a201@posteo.de>
In-Reply-To: <20260313-synology_microp_initial-v3-7-ad6ac463a201@posteo.de>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7340-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[posteo.de,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,markus.probst.posteo.de,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6EC0D289FD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Mar 13, 2026 at 8:03 PM CET, Markus Probst via B4 Relay wrote:
> +impl Command {
> +    fn write(self, dev: &platform::Device<Bound>) -> Result {
> +        // SAFETY: Since we have no of and no acpi match table, we assum=
e this is a mfd sub-device
> +        // and our parent is a serial device bus device, bound to the sy=
nology microp core driver.
> +        let parent =3D unsafe { dev.as_ref().parent_unchecked::<serdev::=
Device<Bound>>() };

Despite being accurate description, "assume" is not what you want to read f=
or a
safety justification. :)

We don't want to directly access the serial device from this driver. Instea=
d,
there should be an abstraction layer of the resource you are accessing.

If this would be I2C or SPI you would request the regmap of the parent at t=
his
point, e.g.

	dev.parent().regmap("led_registers")

Now, this is a serial device, but regmap still works perfectly fine for thi=
s
case. It even allows you to ensure from the MFD driver to restrict the LED
driver of sending commands that are not LED specific by exposing a LED spec=
ific
regmap. Additionally, if you need additional locking etc. it can all be don=
e
within the regmap implementation, so you entirely avoid custom APIs.

I'm not sure how common regmap is for serial devices to be honest, but
apparently there are drivers doing this and I don't really see a reason aga=
inst
it.

For instance, there is drivers/iio/imu/bno055/, which is a chip that works =
on
both serial and I2C busses and fully abstracts this fact with regmap.

In Rust a regmap will probably become a backend of the generic I/O
infrastructure we are working on, which will also allow you to use the
register!() infrastructure, etc.

register!() and some other generic I/O improvements will land this cycle, I=
/O
projections are more likely to land next cycle.

> +        parent.write_all(
> +            match self {
> +                Self::Power(State::On) =3D> &[0x34],
> +                Self::Power(State::Blink) =3D> &[0x35],
> +                Self::Power(State::Off) =3D> &[0x36],
> +
> +                Self::Status(_, State::Off) =3D> &[0x37],
> +                Self::Status(StatusLedColor::Green, State::On) =3D> &[0x=
38],
> +                Self::Status(StatusLedColor::Green, State::Blink) =3D> &=
[0x39],
> +                Self::Status(StatusLedColor::Orange, State::On) =3D> &[0=
x3A],
> +                Self::Status(StatusLedColor::Orange, State::Blink) =3D> =
&[0x3B],
> +
> +                Self::Alert(State::On) =3D> &[0x4C, 0x41, 0x31],
> +                Self::Alert(State::Blink) =3D> &[0x4C, 0x41, 0x32],
> +                Self::Alert(State::Off) =3D> &[0x4C, 0x41, 0x33],
> +
> +                Self::Usb(State::On) =3D> &[0x40],
> +                Self::Usb(State::Blink) =3D> &[0x41],
> +                Self::Usb(State::Off) =3D> &[0x42],
> +            },
> +            serdev::Timeout::Max,
> +        )?;
> +        Ok(())
> +    }
> +}

