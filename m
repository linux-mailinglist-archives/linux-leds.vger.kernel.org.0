Return-Path: <linux-leds+bounces-5464-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C0B51264
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 11:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F86E1B2831C
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 09:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2D9313E0C;
	Wed, 10 Sep 2025 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="CgSV/a87"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838CF30E825;
	Wed, 10 Sep 2025 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757496183; cv=none; b=lUxKtzUeAWrwOyfrq/rkVpbYHpmHlBa79kDISid7Z6fB7OO2SVTw0dRfEi0ncKVszpEZLSP+s+VJ9VIIuWlrwy4xzhVn+YljnnEL4Sf4MSoMF4TC0aEWllRui5zzOhyhgdiD8kbX8I6VY37w0hth+7//I9Cy7afxSm5HI009xMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757496183; c=relaxed/simple;
	bh=4onIzWMeUt//GL9CyNwI0FhKhKNi3drWUGjY2yv9wa8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSAglvxMJz191gT5qTECTyXGe7Aw9ruI0DvN+DCq5sbcMj4V4tjVnq6+tSYYmFggApq1iIyPe/8mvdffPCTuSlAPul0ZwKLlGTAR4w0sIwU72Mm65C2bKNldQhBsB1J057mj3dNhWD8FowufSn7JzRYgidBZvFVjDqhKNUrxU+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=CgSV/a87; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757496176; x=1757755376;
	bh=4onIzWMeUt//GL9CyNwI0FhKhKNi3drWUGjY2yv9wa8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CgSV/a87QtXOKD/VDNEQGeFeRKWFFnJ6lSD75SjxX+25xcJS98O1Q03OS2+6GyoJX
	 dVsNSU+kX8vPlH6gjCnciUUOu9vVEeMNzIOWzdChcANqCdfYdTSWFKod5ArUKSC61l
	 izs9Lm4GDxHHqV6YVkPmX/6r9jptLfaqrQXXAejA5i310zJjwbJFPoMsy8QoBsFXfl
	 VjEl5k+XM2SBxGpwz/JG++f3o27ExkInkiwecwS9vwYYUTxQGpiRqAHWuoU2Tasn80
	 WtX1M8Fe7pABIvrYWUewDoSx4ro/vdyepm1xYazylM43ahXvWopM/IygBZET6BtWDq
	 Th5nwOvvJPe5Q==
Date: Wed, 10 Sep 2025 09:22:53 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer documentation
Message-ID: <u6ZY13Lkl_fUDmiudck6EB28tChZkCOAUHGYLWvwJAQCWGBVio_VmhdPHlS1WBmN9XrftBvjSjwT7Ok-IpeW57AX2xv7u4dMPoC-1iO5z0g=@vinarskis.com>
In-Reply-To: <108895ac-0c4d-4aee-86b1-96461e00def3@oss.qualcomm.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com> <20250908-leds-v3-1-5944dc400668@vinarskis.com> <MOj2NUVAdyu9bvVkEON8rhAlGJ9FRRh9gJABkrOR_6gKhE8rmeZ5Isbj9noA1bDZ12gY4dlDpEtmEjxlRTucCssKwTo4f5nCowMOin85IKk=@vinarskis.com> <d957d16f-d206-4f7d-b52e-a2cad9e4abfc@kernel.org> <108895ac-0c4d-4aee-86b1-96461e00def3@oss.qualcomm.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: d2805003f1d5c8c724396ed245543dea6900c2f6
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Wednesday, September 10th, 2025 at 10:35, Konrad Dybcio <konrad.dybcio@o=
ss.qualcomm.com> wrote:

>=20
>=20
> On 9/9/25 10:39 PM, Hans de Goede wrote:
>=20
> > Hi,
> >=20
> > On 9-Sep-25 6:57 PM, Aleksandrs Vinarskis wrote:
> >=20
> > > On Monday, September 8th, 2025 at 01:18, Aleksandrs Vinarskis alex@vi=
narskis.com wrote:
> > >=20
> > > > Introduce common generic led consumer binding, where consumer defin=
es
> > > > led(s) by phandle, as opposed to trigger-source binding where the
> > > > trigger source is defined in led itself.
> > > >=20
> > > > Add already used in some schemas 'leds' parameter which expects
> > > > phandle-array. Additionally, introduce 'led-names' which could be u=
sed
> > > > by consumers to map LED devices to their respective functions.
> > > >=20
> > > > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > > >=20
> > > > ---
> > > > .../devicetree/bindings/leds/leds-consumer.yaml | 89 ++++++++++++++=
++++++++
> > > > 1 file changed, 89 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.y=
aml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..d50a3850f6336e9e3a5=
2eb1374e36ea50de27f47
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > > > @@ -0,0 +1,89 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Common leds consumer
> > > > +
> > > > +maintainers:
> > > > + - Aleksandrs Vinarskis alex@vinarskis.com
> > > >=20
> > > > +
> > > > +description:
> > > > + Some LED defined in DT are required by other DT consumers, for ex=
ample
> > > > + v4l2 subnode may require privacy or flash LED. Unlike trigger-sou=
rce
> > > > + approach which is typically used as 'soft' binding, referencing L=
ED
> > > > + devices by phandle makes things simpler when 'hard' binding is de=
sired.
> > > > +
> > > > + Document LED properties that its consumers may define.
> > > > +
> > > > +select: true
> > > > +
> > > > +properties:
> > > > + leds:
> > > > + oneOf:
> > > > + - type: object
> > > > + - $ref: /schemas/types.yaml#/definitions/phandle-array
> > > > + description:
> > > > + A list of LED device(s) required by a particular consumer.
> > > > + items:
> > > > + maxItems: 1
> > > > +
> > > > + led-names:
> > >=20
> > > While going over the feedback I realized `leds` and `led-names` do
> > > not follow `property`, `property-names` convention. Any objections
> > > if I rename `led-names` to `leds-names` for consistency?
> >=20
> > No objections from me, `leds-names` indeed is better.
>=20
>=20
> FWIW we have "clocks"/"clock-names", "resets"/"reset-names" etc.
>=20
> I sometimes refer to "property"/"property-names" during review to
> bring attention to the preferred style (ordering of such entries),
> which is maybe what confused you

Hmm fair. Just thought 'led-names' looks a bit ugly under 'leds'. But
you are right, since there are already "clocks"/"clock-names",
"resets"/"reset-names", lets keep it that way.

Thanks for clarification,

Alex

>=20
> Konrad

