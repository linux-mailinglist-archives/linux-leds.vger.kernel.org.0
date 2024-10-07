Return-Path: <linux-leds+bounces-2987-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4F399388F
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 22:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 061BFB21805
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 20:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5358718B491;
	Mon,  7 Oct 2024 20:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="WQRt6cc1"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03EA41C7F;
	Mon,  7 Oct 2024 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334387; cv=none; b=rB4tSO4z5HC2mKnT8HaAHk+hLIjVE1AqVyaxVq/qR/4aaVTNlArgmXWslskkxolfETCxISQRx/EHS3nPXoKKM812HzR7W5UKhZQiyRm7D0dm6ZVVOCK6Gr8DX24KKprKMOmn9WUqS7UQq1NMIoxvXXZ6p10Xh40q8FopZ6jPkb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334387; c=relaxed/simple;
	bh=6ogw3sZvXB5dWJWJYCgI2TS+lYZhQtKrkp0miIwCkMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYlWkXLuRQdrD0Tjdw7Ko/NNvI+e9b8DdvKNXuV4MTOda5hCeoYHF9klxLu9p3X2AhIiMnbI2Yi5OaQGZtMV2OfB+hlHkTI58fCceR0q461Q3wxf29HfrL+gWMFD+QRiGupGPUFVzk5AJpuRifQ3EPQ4Hw0bvOCYqbxGlwlK/7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=WQRt6cc1; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kH67In2vOx5AviMTppuriiT6BzmoKGXayNjsYGVnNA4=; b=WQRt6cc1/5/JzDQCMwbcFDZhhf
	0Xhfp7K29vsJs7LBQhCOxT4SHpOQMZftkoU6RWKc1QDTbwvsA9dsCnjIZdzu1NQpE9AOkfDsyZ9Ew
	HW8jmNxXsjtvgR/XsVuEg+DgFLZxyDhynaUpBEH0lCwSkH47XzdU1eNxyAHX5HMJi2XmUKGwM16rY
	bZcCVZyJpt9Fbc3iPzmCZbd9kXxPP5DMXUUZg5FkVgNs6Mfk/sO43LKMZKsKUs5s9qPgBYoFmHtS5
	EyliszWAqUgOGZAAAicP0zbPXPyFPx3I6QnqbC4AGYRYnLp4DoPVx+sqjfeYtVhuhOyFflYp+rmdC
	zm4PX8dw==;
Received: from i5e860d18.versanet.de ([94.134.13.24] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sxuiu-0006DK-0p; Mon, 07 Oct 2024 22:52:56 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Pavel Machek <pavel@ucw.cz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Document "rc-feedback" trigger
Date: Mon, 07 Oct 2024 22:52:55 +0200
Message-ID: <4934483.GXAFRqVoOG@diego>
In-Reply-To: <ZwQh99TjfKhoP6UK@duo.ucw.cz>
References:
 <20241007160804.2447947-1-heiko@sntech.de> <ZwQh99TjfKhoP6UK@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 7. Oktober 2024, 20:01:27 CEST schrieb Pavel Machek:
> On Mon 2024-10-07 18:08:04, Heiko Stuebner wrote:
> > Document the "rc-feedback" trigger which is used to control LEDs by
> > remote control device activity. This is an existing trigger used in
> > existing DTs, document it so validation of those DTs would pass.
> > 
> > It was originally introduced into the Linux kernel in 2013 with
> > commit 153a60bb0fac ("[media] rc: add feedback led trigger for rc keypresses")
> 
> > index bf9a101e4d42..32f9116e03a2 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -119,6 +119,8 @@ properties:
> >              # if trigger is absent
> >            - none
> >              # LED indicates camera torch state
> > +          - rc-feedback
> > +            # LED indicates remote control feedback
> >            - torch
> >              # LED indicates USB gadget activity
> >            - usb-gadget
> 
> NAK. Wrongly placed comment.

you're right, and it even messed up the torch comment + entry
Will send a v2

Heiko




