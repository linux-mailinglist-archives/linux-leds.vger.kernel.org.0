Return-Path: <linux-leds+bounces-5394-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A5FB44A0D
	for <lists+linux-leds@lfdr.de>; Fri,  5 Sep 2025 01:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8503A17F512
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 22:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6342F49F6;
	Thu,  4 Sep 2025 22:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="NmlUE5Qr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0992F5337
	for <linux-leds@vger.kernel.org>; Thu,  4 Sep 2025 22:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757026381; cv=none; b=EhV5fuG6E2XmLyQN6HettJA4GS5Oo7T65zKTw03yRX8E+RCK/YWRq+SCIzi4kWqFdcdsmE3KN9F60DklGJvK/8O0A+XaCRQb0NBpPJ9Ak62WjbMvNOI6CCwLveZwo4Y6wpgPz6QxchjaxH1hDWJW77bzL41AVFJcZkwg128FtPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757026381; c=relaxed/simple;
	bh=2qEfTuQbxq4dEuf34SXqxiyMI483CYAAykSVdrB6xyA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GizCMeudIdEO5e5n5A5mPkUiqmwNoGpMUkB0t6bCjxRo3A2iuZdOR2Y7v/ZTQwfsGp8gFBPtiwL99hFVkeA80+CCeaqjEh7uJrGSU1MeWo9KZgKSAMoKgzXCzADC3aE+6sBbd9k4SZK/Vw7iubNnqnNoeA5y4uegCq0xXkigQ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=NmlUE5Qr; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757026375; x=1757285575;
	bh=aM3c6Yuzp8F2byGnnh40DrCDZBPjyinQft4WloVRyw8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NmlUE5QrbKoRXoFKHlEpOtanZJmeoHaPB0nSR07bD1iEE5M9/mqC2LN+jWeF2zWwe
	 +aEmbrvn+4saRbeBskUO+dN99BugXYqw2N1LDhWdfg/w4pscaTFl/0AO1C272RSizy
	 mmDpEz5G0NEL4EjcnfrQHXW0AiuDz/1QIbd3bR8hMaLorlZLBGW3F1oaHw+AU93OOd
	 c1p7c8hxpFMzB0U/YAeRfo3eCUKaTXDxA4UYZWY7KEPrvpqNMArc/t9VlnJPm+QBpi
	 FyOCUgFKd177+de+dCfi7m/v9xTEHtKT/IMMa09ttofatKvqgihmammFCXNcZAIn0C
	 4lu/f0LOkjRpg==
Date: Thu, 04 Sep 2025 22:52:52 +0000
To: Rob Herring <robh@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, bryan.odonoghue@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, pavel@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add generic LED consumer documentation
Message-ID: <mezxKi1PjYxVeMQouXO6GIllmTyc_TxT8zQdbpoDYTutqhJ6q5ydm7Q6MsjM3iiFvVuz0t6Uz80dvIjVaJJrNehz9xvTXTCgZiccv1ihd5Q=@vinarskis.com>
In-Reply-To: <20250904141004.GA3875305-robh@kernel.org>
References: <20250902182114.GA965402-robh@kernel.org> <20250903235615.134520-1-alex@vinarskis.com> <20250904-brave-zippy-quoll-fcb054@kuoka> <daf442a6-b4d6-4213-8ec0-10397d682cc4@kernel.org> <fdc68c54-a499-4ba6-8788-70c7ea515f2d@kernel.org> <691f72aa-6d3e-47a1-9efe-a5f7a61ecb72@kernel.org> <9c536e24-ab5a-454a-93af-6d4c51d4e1ce@kernel.org> <ece22424-ea6f-4d6e-8964-3418853dba2f@kernel.org> <e89de497-9c6e-4a4c-8f66-019d349c171b@kernel.org> <20250904141004.GA3875305-robh@kernel.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 44efca61c0533fe4c4af410e474a0f59544dcdc3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Thursday, September 4th, 2025 at 16:10, Rob Herring <robh@kernel.org> wr=
ote:

>=20
>=20
> On Thu, Sep 04, 2025 at 02:05:08PM +0200, Hans de Goede wrote:
>=20
> > Hi Krzysztof,
> >=20
> > On 4-Sep-25 1:47 PM, Hans de Goede wrote:
> >=20
> > > Hi Krzysztof,
> > >=20
> > > On 4-Sep-25 12:47 PM, Krzysztof Kozlowski wrote:
> > >=20
> > > > On 04/09/2025 12:29, Hans de Goede wrote:
> > > >=20
> > > > > Hi Krzysztof,
> > > > >=20
> > > > > On 4-Sep-25 11:45 AM, Krzysztof Kozlowski wrote:
> > > > >=20
> > > > > > On 04/09/2025 09:26, Hans de Goede wrote:
> > > > > >=20
> > > > > > > > > > > +maintainers:
> > > > > > > > > > > + - Aleksandrs Vinarskis alex@vinarskis.com
> > > > > > > > > > > +
> > > > > > > > > > > +description:
> > > > > > > > > > > + Some LED defined in DT are required by other DT con=
sumers, for example
> > > > > > > > > > > + v4l2 subnode may require privacy or flash LED.
> > > > > > > > > > > +
> > > > > > > > > > > + Document LED properties that its consumers may defi=
ne.
> > > > > > > > > >=20
> > > > > > > > > > We already have the trigger-source binding for "attachi=
ng" LEDs to
> > > > > > > > > > devices. Why does that not work here?
> > > > > > > > >=20
> > > > > > > > > I have not actually considered this, as the existing priv=
acy-led solution
> > > > > > > > > from the original series is not trigger based. At least o=
ne of the reasons
> > > > > > > > > for that is that trigger source can be rather easily alte=
red from user
> > > > > > > > > space, which would've been bad for this use case. If v4l2=
 acquires control
> > > > > > > > > over the LED it actually removes triggers and disables sy=
sfs on that LED.
> > > > > > > >=20
> > > > > > > > So does that mean that v4l2 solves the problem of "trigger =
source can be
> > > > > > > > rather easily altered from user space"?
> > > > > > >=20
> > > > > > > Yes, currently the v4l2-core already does:
> > > > > >=20
> > > > > > Thanks, I understand that it solves the problem described in th=
e patch,
> > > > > > so the patch can be dropped.
> > > > >=20
> > > > > I'm a bit confused now, do you mean that this dt-bindings patch c=
an
> > > > > be dropped ?
> > > >=20
> > > > Yes.
> > > >=20
> > > > Alex's explanation to Rob felt confusing, so I asked for clarificat=
ion.
> > > > You clarfiied that that v4l2 solves the problem, therefore there is=
 no
> > > > problem to be solved.
> > > >=20
> > > > If there is no problem to be solved, this patch is not needed.
> > > >=20
> > > > If this patch is needed, just describe the problem accurately.
> > > >=20
> > > > > The existing v4l2-core code solves getting the privacy-LED on ACP=
I/x86_64,
> > > > > on DT there is no official bindings-docs for directly getting a L=
ED with
> > > >=20
> > > > There are and Rob pointed to them. If Rob's answer is not enough, m=
ake
> > > > it explicit.
> > > >=20
> > > > Really, there are here some long explanations which do not really
> > > > explain this in simple terms. Simple term is: "existing property fo=
o
> > > > does not work because <here goes the reason>".

Ill extend the commit description to better explain why the existing trigge=
r-source
could not be re-used.

> > >=20
> > > The existing trigger-source binding for "attaching" LEDs to
> > > devices does not work because:
> > >=20
> > > 1. It depends on the Linux specific LED trigger mechanism where as
> > > DT should describe hw in an OS agnostic manner
>=20
>=20
> Using a binding does not require using the linux subsystem normally
> associated with it. Certainly the naming was inspired by the Linux
> subsystem, but it's really nothing more than a link.
>=20
> > > 2. It puts the world upside down by giving possible event-sources
> > > for the (again) Linux specific trigger rather then allowing
> > > specifying e.g. specific privacy and flash LEDs as part
> > > of a camera dts node. IOW it makes the LED DT note point to
> > > the camera, while the LED is a part of the camera-module.
> > > not the other way around. So it does not properly allow
> > > describing the composition of the camera.
>=20
>=20
> Direction of the connection doesn't really matter. You can get the
> association either way. But certainly one way is easier than the other.
>=20
> > > Note that Rob actually put "" around attaching because this
> > > property really is not proper attaching / composition as
> > > we would normally do in dt.
> > >=20
> > > IMHO 1. alone (this being Linux specific) warrants a new better
> > > binding for this.
> >=20
> > And:
> >=20
> > 3. There already are bindings using a leds =3D phandle-array property i=
n:
> > Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
>=20

Another example using leds =3D phandle-array in:
Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml

>=20
> This is most convincing for me. So please move this to a
> led-consumer.yaml schema first so we have exactly 1 definition of the
> property. And summarize the discussion here for why we need this.

Just to confirm that I understood this discussion correctly:
- Keep 'led-consumer.yaml' (with improved description)
- Drop leds property from existing schemas that use it as phandle-array
- Instead reference 'led-consumer.yaml' via 'allOf'. This should also be
  added to 'video-interface-devices.yaml' as various camera schemas based
  on it typically do not allow unevaluated properties.

Thanks for the reviews,

Alex

>=20
> Rob

