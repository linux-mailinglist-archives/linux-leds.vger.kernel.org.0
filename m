Return-Path: <linux-leds+bounces-3027-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2901F99724D
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 18:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 918B8B274F8
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 16:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D6E19C55C;
	Wed,  9 Oct 2024 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="T0CARoIV"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACC21925A0;
	Wed,  9 Oct 2024 16:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492659; cv=none; b=C0/dorTgqQst9S61XD6gfLpBJ4kAfnXLGIR64pHUwNYg6aIn34Q4z/3byTEGTbQqQepTGG1RWdV9KJqVPiLBvBsfnjCuX+IzhWKAz1r2O+dnjKes7ikQM8mfcCIIkFScPhxImtQ5kTUX/tgLHbhK9o8J+zauhqhu838slc6X7Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492659; c=relaxed/simple;
	bh=gS4HMRH0q2TPHDpWTNcpjFiraeaB5hG2j7mBI3mqYek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ICx7GAznLZLnLrYyN11j/yZ38u21B2imRQOniJiFFN0glBnbw8RN7Ks0lLFp+t5cCLrR8UnEEGEdJEqnAmJrblx9gcEgiruITdG7kZ2iHi/NgZewLLhbLu5BituBrOn5Q7aPEklHvPm+w5ri/WVk87306Z8fAyilfFlswLQnZJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=T0CARoIV; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hoWN2VRIRjlyI3uHup5NKQ8PI2LmFRmGvM53PwKo3sE=; b=T0CARoIVEi+wmPCQlKiAP5ObQv
	aQhFNjOoIsdPRfYZlVG4Ah58W38UJiTSG2l3Fo3nHP5itg0SttTqxDB7GScYW/dfknNi5Dxb6mzkt
	gBGh7uSC+Mxq7l5BHBvDP6EBC5pHL7qVdCxyrbho5kQ8YTKf1X2Hkg3EoFq9SgO7qMIQLodSLN1GH
	a7+tgwKcNb/L4MafL19ff7BftcQO1+Ewrn0iV4PjCvcIe7OfYsrGoPv3CXveCmUrylfl807c04CAC
	YdH50yliHhUHVAxm1ypK5gAVslETHDAuziEZpu9YW2bTUHyo1ZXZHzCPxSJ+3YjSUy5DTZuiX9PLf
	75ZY4ZZw==;
Received: from i53875bf1.versanet.de ([83.135.91.241] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1syZtn-0006VZ-0H; Wed, 09 Oct 2024 18:50:55 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Lee Jones <lee@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "rc-feedback" trigger
Date: Wed, 09 Oct 2024 18:50:54 +0200
Message-ID: <23688435.6Emhk5qWAg@diego>
In-Reply-To: <20241009144836.GA596552@google.com>
References:
 <20241007205315.2477060-1-heiko@sntech.de>
 <20241009144836.GA596552@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Lee,

Am Mittwoch, 9. Oktober 2024, 16:48:36 CEST schrieb Lee Jones:
> On Mon, 07 Oct 2024, Heiko Stuebner wrote:
> 
> > Document the "rc-feedback" trigger which is used to control LEDs by
> > remote control device activity. This is an existing trigger used in
> > existing DTs, document it so validation of those DTs would pass.
> > 
> > It was originally introduced into the Linux kernel in 2013 with
> > commit 153a60bb0fac ("[media] rc: add feedback led trigger for rc keypresses")
> > 
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > changes in v2:
> > - put the entry in the correct position and comment above it (Pavel)
> > 
> >  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > index bf9a101e4d42..9cd89f30fa7c 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -118,6 +118,8 @@ properties:
> >              # No trigger assigned to the LED. This is the default mode
> >              # if trigger is absent
> >            - none
> > +            # LED indicates remote control feedback
> > +          - rc-feedback
> 
> Is 'rc' a recognised and well known abbreviation for remote control?
> 
> How about we people some (look-up) time and say:
> 
>   - remote-control-feedback

The issue being that this exact trigger rc-feedback is in the kernel for
11 years already - see the commit link in the description, and used in
a number of boards in the wild since then.

So the naming-ship has sailed for a while now, and this change
"simply" documents the status quo. And judging from Rob's Ack
it looks like he's okay with the naming too.


Heiko



