Return-Path: <linux-leds+bounces-5395-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B839B44A15
	for <lists+linux-leds@lfdr.de>; Fri,  5 Sep 2025 01:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 184DB5A210C
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 23:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBFB2EBDC8;
	Thu,  4 Sep 2025 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="MmoKbxAK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138DC2E3B07;
	Thu,  4 Sep 2025 23:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027012; cv=none; b=GbpIov+El8h5SRH3BFUUh4U5L8NIguzwYm1rfUPsD8D84Q/xhPw0r06w9ZJx5HOeS+f5Q9ENiUTW+fgJj7nPyYaWbF47LF6buWY6iT9wMMhO/fN2LEg7c0KYkrJeXtYVKqucPCy9vd//GFS6rDDeiwvkuR28WiOp4FRYhkBpaJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027012; c=relaxed/simple;
	bh=jRNyeoBzZRH45fmWVajqG9PsWjW1FL+RS0speXA161Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bDuiDqvjv2g4TsR9Xm1h0GFIpRg6ZbUVN5plFB7VWxzj1x6HGXWkICD6CiT3RUdoVtqlSDNXw0hqDDXj9eH6FhaQUJB/hLvedFwcU2SRkMj7PIWD5h7dGR0+/CbHlIg/zT79F5e+qVcHUYvVY1hoquyrMUtJ9anq4PUbzmv0gsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=MmoKbxAK; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757027008; x=1757286208;
	bh=jRNyeoBzZRH45fmWVajqG9PsWjW1FL+RS0speXA161Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MmoKbxAKAV3Sau30gKGkwSH2aTSzgxFkPpb/CgL8D9+ml46aGz6HC9PBg9hDicTvV
	 BM+KxaBHboGTscXaBtUa084mXs7ucU+qC2vYyhMWaic6iSIb1NiczZHRD3NC0LyXaT
	 W4I4PmZpvrKl2FLCjVhfx2k2mIhjxYfpHgBoKrMLIxMqa/el+Ap8wiF5xYJNTDJCV0
	 wa48lJs9bUsMCYb/ElnsviR/LsR0h3LCbbmeD0w4mhfRHuPxqm4Hmxdn8cCtqk1r0J
	 zmJp6QD3zbqopehsxCIrwNWA0kYfqxVXJKHLWsDQ+vkNbgIvNXuV0C4zDB3HTupSjP
	 uk438LfPQwJlA==
Date: Thu, 04 Sep 2025 23:03:24 +0000
To: Hans de Goede <hansg@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, bryan.odonoghue@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, pavel@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add generic LED consumer documentation
Message-ID: <eIVbqSrHWXJoeb0YPQhhV34JrEBrxjc6crA3JMIJFG-3GGq1XHVnBQcQvQR3ezhK3x2dyaUQfv65raJtvsp5qgJXHNbE3Sqnl8DBLDpnsSE=@vinarskis.com>
In-Reply-To: <691f72aa-6d3e-47a1-9efe-a5f7a61ecb72@kernel.org>
References: <20250902182114.GA965402-robh@kernel.org> <20250903235615.134520-1-alex@vinarskis.com> <20250904-brave-zippy-quoll-fcb054@kuoka> <daf442a6-b4d6-4213-8ec0-10397d682cc4@kernel.org> <fdc68c54-a499-4ba6-8788-70c7ea515f2d@kernel.org> <691f72aa-6d3e-47a1-9efe-a5f7a61ecb72@kernel.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 1bfe9cec307f335b8e6a72583de53f5d0e92ff3b
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Thursday, September 4th, 2025 at 12:29, Hans de Goede <hansg@kernel.org>=
 wrote:

>=20
>=20
> Hi Krzysztof,
>=20
> On 4-Sep-25 11:45 AM, Krzysztof Kozlowski wrote:
>=20
> > On 04/09/2025 09:26, Hans de Goede wrote:
> >=20
> > > > > > > +maintainers:
> > > > > > > + - Aleksandrs Vinarskis alex@vinarskis.com
> > > > > > > +
> > > > > > > +description:
> > > > > > > + Some LED defined in DT are required by other DT consumers, =
for example
> > > > > > > + v4l2 subnode may require privacy or flash LED.
> > > > > > > +
> > > > > > > + Document LED properties that its consumers may define.
> > > > > >=20
> > > > > > We already have the trigger-source binding for "attaching" LEDs=
 to
> > > > > > devices. Why does that not work here?
> > > > >=20
> > > > > I have not actually considered this, as the existing privacy-led =
solution
> > > > > from the original series is not trigger based. At least one of th=
e reasons
> > > > > for that is that trigger source can be rather easily altered from=
 user
> > > > > space, which would've been bad for this use case. If v4l2 acquire=
s control
> > > > > over the LED it actually removes triggers and disables sysfs on t=
hat LED.
> > > >=20
> > > > So does that mean that v4l2 solves the problem of "trigger source c=
an be
> > > > rather easily altered from user space"?
> > >=20
> > > Yes, currently the v4l2-core already does:
> >=20
> > Thanks, I understand that it solves the problem described in the patch,
> > so the patch can be dropped.
>=20
>=20
> I'm a bit confused now, do you mean that this dt-bindings patch can
> be dropped ?
>=20
> The existing v4l2-core code solves getting the privacy-LED on ACPI/x86_64=
,
> on DT there is no official bindings-docs for directly getting a LED with
> led_get() AFAICT and I believe that having a binding is mandatory before
> we just start adding leds and led-names properties to DT nodes for sensor=
s ?
>=20
> Maybe for v2 of this patch-set Aleksanders should also add a patch
> actually using the new binding in a dts file to make clear that
> the intent is to also start using privacy-LEDs in the same way
> on DT systems ?

Sure. X1E camera support did not land yet, so it will be just one device fo=
r now then.

Regards,

Alex

>=20
> Regards,
>=20
> Hans

