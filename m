Return-Path: <linux-leds+bounces-5253-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66507B2D5E4
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 10:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3928C18866DC
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 08:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D7C2D837E;
	Wed, 20 Aug 2025 08:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvcgfbvS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4242239E91;
	Wed, 20 Aug 2025 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755677676; cv=none; b=AWWYKSlGU/ir5SijQUdqdIwwIWbW8nEVVAKnsacsyGDh4O6YnslEFS3UGgZ4AG5lH+o8CVKqm9Dt39EtCSB1D95z3+lQW/MFNSEDJmkCvJEp8zosGjHb7D+bB53OKxb+XXMtz25pSdVNv5Yp85j1N2Jv5sNgq+UZt7Nw51kOZyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755677676; c=relaxed/simple;
	bh=Q0amB+FLN0DKHfucM8btGqFHkdrP29AlfTdO55mBX58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdsqo/r11td9e6lZ+KwaKwjtoGT0GWAeN4rk38fqH9R2PJPpHVq2MjcmaqGNJLGevKucioMjuD+otxg02JIbJEZcXq2tWOlpjfT7UEAVJmdRpRe/xe7/VDYDDCvFReDMP+OHV03Lh/leusyQLh+YntAfQmAbyuVRE+wV0y5GA4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvcgfbvS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08A0C113D0;
	Wed, 20 Aug 2025 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677676;
	bh=Q0amB+FLN0DKHfucM8btGqFHkdrP29AlfTdO55mBX58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvcgfbvS6AsdIkvJMpDJNKGzo221HJZRMdcyFRDHWAMrBbTVX1tnPNSNsugIoaj7I
	 v5vK2w3XllMb+jW38L1BUIgzU9Sg2va5GYCyRTEp88dH1zhat3N4Q8sKRWSkZCyPuk
	 him2qQyqT9SmbJGhAq5gABuTTDg1qGJQx57Mjv426uOahFC+95JgcBpjHOWaXu1fVR
	 ZnkjtM6XqbuiDkFLhF7mtPBb6oclYlJ8/RDPF4EewW2M7DSCtvizmMAcb4RXXja9lT
	 MZGGnW+dp2TGAwyfuCNtBu3keCcn4LFrE6M8S58tjvAdSP8xOuqlp55UCCxHlydhob
	 uYsYemGDsE8VA==
Date: Wed, 20 Aug 2025 10:14:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Clearly mark label property as
 deprecated
Message-ID: <20250820-hairy-economic-wildebeest-ba25a1@kuoka>
References: <20250815104805.405009-1-didi.debian@cknow.org>
 <b30905fa-6bd1-47dd-8371-f609d418387b@kernel.org>
 <DC2ZLORG11W0.1CS78L6F2OV4Q@cknow.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DC2ZLORG11W0.1CS78L6F2OV4Q@cknow.org>

On Fri, Aug 15, 2025 at 02:06:49PM +0200, Diederik de Haas wrote:
> On Fri Aug 15, 2025 at 1:00 PM CEST, Krzysztof Kozlowski wrote:
> > On 15/08/2025 12:47, Diederik de Haas wrote:
> >> The text description already mentioned the label property was
> >> deprecated, but using the 'deprecated' property makes is clearer and
> >> more explicit.
> >> 
> >> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> >> ---
> >>  Documentation/devicetree/bindings/leds/common.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >> 
> >
> > Please first read previous discussions:
> 
> [I reversed the order of the links so the oldest is first]
> 
> > https://lore.kernel.org/all/20221122111124.6828-1-cniedermaier@dh-electronics.com/
> 
> Rob: "They ['function' and 'label'] serve 2 different purposes."
> 
> > https://lore.kernel.org/all/20240509110545.49889-1-linux@fw-web.de/
> 
> Krzysztof: "I don't think there was conclusion to make it deprecated on
> last attempt"
> 
> I agree.
> What I don't understand: Why wasn't the text updated to correct the
> incorrect statement about deprecation (that's how I interpret it now)?
> Or some other conclusion being made and that that will be reflected in
> the text and/or a deprecated property.
> 
> Otherwise the confusion remains and then it's just a matter of time
> before a 4th person comes along proposing the same patch.
> And possibly even more harmful: people use it incorrectly.

Whatever change you want to do here, I expect to address one way or
another these previous discussions. If the code is confusing, refine the
description. But not in a way which ignored previous feedbacks.

Best regards,
Krzysztof


