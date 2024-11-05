Return-Path: <linux-leds+bounces-3282-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A99BD13A
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 16:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8651F21B0E
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 15:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE01413D881;
	Tue,  5 Nov 2024 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCe30A9f"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141538DD6;
	Tue,  5 Nov 2024 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822279; cv=none; b=QrKM1v07gs1UCeCTYyPkKZc9R0sc1gSoCaq/RiRVzq5wJWo/AOTIhAx+a19ltICQE6UcuDeWexazm5tugxHJcW0+Y17NKftD6H0j/35FCMDIyySepC73NLzI3GnlR23OladYAHimpv/9oS91sTwejHPvRhZHsALR1OerPSyeJhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822279; c=relaxed/simple;
	bh=ou22O8RDUi8KZSgCMaSSv2Or09Rq9phV/01ikujjiqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFMJmXL/QOC/7wGdgiFKmn7Ps36TUlHS4cD0Tr86zk6WnF4R0AC4l2XzSfE9fcRg355j5DQAaD+l9mzXxQ3lykfLDDT1FAzyA3KuM+Y+a9AontTuISqDbLhlgOA75eEtM1xhKtOsiHiGvjnp4QEC+c8+cZy7KQxgMbBAPSo/4yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCe30A9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20631C4CECF;
	Tue,  5 Nov 2024 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730822279;
	bh=ou22O8RDUi8KZSgCMaSSv2Or09Rq9phV/01ikujjiqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCe30A9faTUoeOwcTM3qlVBQE7aJhOBw5/Zq4xQFircPkncJlKppKZ+sABmIAYUos
	 /Ggbe8Vy2m1WosbEblN9KIBMGexrzQ0IM3jpV4qWdZR6QIk/ab/wUrSFF3n/exo9Tv
	 F8KxvaBdHx69qiHpHBJl4c3TjAj37nLIp8tBhXG8IyUGRZTQsFPhYiSKiDatieIrph
	 MAH+nBkaEEDqKp4dzqsUuC8kKvM9ugeLP9BPTngbOUIMEPTLhjvcj/7g7Yn+/GZoVB
	 /S2Kc5SEFa8d6kYh7QWQEXobqzE//1myxruQDDItkTyomwMxo0m8RL3oSXv923pmp2
	 Lo69Ga5dvZI0w==
Date: Tue, 5 Nov 2024 15:57:54 +0000
From: Lee Jones <lee@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, pavel@ucw.cz,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: pwm: Add default-brightness
 property
Message-ID: <20241105155754.GD1807686@google.com>
References: <20241101154844.1175860-1-gnstark@salutedevices.com>
 <20241101154844.1175860-2-gnstark@salutedevices.com>
 <ngwfccj55vovsaj5bdealdidgxdrxfl7nwxfdqponqzdiv3olo@epzabbxkdzxb>
 <aa96e9ab-00d6-413b-a7e8-8c709087f5bc@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa96e9ab-00d6-413b-a7e8-8c709087f5bc@salutedevices.com>

On Sun, 03 Nov 2024, George Stark wrote:

> Hello Krzysztof, Rob
> 
> Thanks for noticing it, missed the tag not by purpose, sorry about it.
> Sure I'll add the tag to v3 if v3 happens.

Please reply directly under the text you're referring to.  Top-posting
is not allowed.

Please submit a v2 [RESEND] complete with the missing tags.

> On 11/2/24 16:06, Krzysztof Kozlowski wrote:
> > On Fri, Nov 01, 2024 at 06:48:43PM +0300, George Stark wrote:
> > > Optional default-brightness property specifies brightness value to be
> > > used if default LED state is on.
> > > 
> > > Signed-off-by: George Stark <gnstark@salutedevices.com>
> > > ---
> > >   Documentation/devicetree/bindings/leds/leds-pwm.yaml | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > 
> > <form letter>
> > This is a friendly reminder during the review process.
> > 
> > It looks like you received a tag and forgot to add it.
> > 
> > If you do not know the process, here is a short explanation: Please add
> > Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
> > or above your Signed-off-by tag. Tag is "received", when provided
> > in a message replied to you on the mailing list. Tools like b4 can help
> > here. However, there's no need to repost patches *only* to add the tags.
> > The upstream maintainer will do that for tags received on the version
> > they apply.
> > 
> > https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
> > 
> > If a tag was not added on purpose, please state why and what changed.
> > </form letter>
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> -- 
> Best regards
> George

-- 
Lee Jones [李琼斯]

