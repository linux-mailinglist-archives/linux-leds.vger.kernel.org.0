Return-Path: <linux-leds+bounces-3239-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28689BA02C
	for <lists+linux-leds@lfdr.de>; Sat,  2 Nov 2024 14:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 917B12825F9
	for <lists+linux-leds@lfdr.de>; Sat,  2 Nov 2024 13:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2EA189F36;
	Sat,  2 Nov 2024 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuEeBoKa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F586EAC6;
	Sat,  2 Nov 2024 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730552819; cv=none; b=H1orn7ybDR+Rd03q0pp/1HaCHMMsOr/354wqIELDj9Q5rMyvLJ/ixBrs0Wbc1+R5R4qj5MSlm9eI6OpHikBaKMvgXbIo7LbRo0vjs+irg8qyNBJ+tiQwn5iSdp1x3eG6Zl3seYR3Zh7mN2CaJ7Z7mUGpTRzf7IB3jId4/kt2Dtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730552819; c=relaxed/simple;
	bh=QUQZ/U08FUV2AMYlJQIt0c1roE/xH5qntepaJpWp+rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPZk/MyRflatoxgWhGn+Coen7cZgEhJia8maud96nRJyKVcqKfVgpTbUj2JKPRrhiXd9dxexs7Kd9j7Navl8OSfsHViz2bc2vzZbQy7zR9qIRLWu7Kcv31n2IO7j1PBuQV2d3AuBtuqFHOZ84DjS2IKsfd5nHSfU6S1GtMQqP2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuEeBoKa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AB7C4CED0;
	Sat,  2 Nov 2024 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730552818;
	bh=QUQZ/U08FUV2AMYlJQIt0c1roE/xH5qntepaJpWp+rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuEeBoKaKrzBUnRKXjnLXHmnVcYNKRqeWjwdEnb+kVkL1oMNGzPFxk4Jaoz1oauI9
	 kWZ2upyiseDzvmWb4cKzkuRuE1T25A2EeoBJsxH9BMGlen54b916bYyMHE2A5TK7uo
	 WgoWPtip1k2IUB9EIolrgpZv7gqSBje1vJbAuze1fR+zOVkLm2IL5mFBR3HYiYD+Ik
	 zw0Pwv2ogwwLPaRJnhWXJUxOdzLHFJIRh8HhjVuRyIn1huVkizufvS/tbymq+6CWDe
	 oyqQTaO1ijmJgZyDk9FOYxGL35pht+cVQt35lykhAwfWcTXUxdu5Y9MkErmAbiyGqn
	 oPuFY6dND5+dQ==
Date: Sat, 2 Nov 2024 14:06:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: pwm: Add default-brightness
 property
Message-ID: <ngwfccj55vovsaj5bdealdidgxdrxfl7nwxfdqponqzdiv3olo@epzabbxkdzxb>
References: <20241101154844.1175860-1-gnstark@salutedevices.com>
 <20241101154844.1175860-2-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101154844.1175860-2-gnstark@salutedevices.com>

On Fri, Nov 01, 2024 at 06:48:43PM +0300, George Stark wrote:
> Optional default-brightness property specifies brightness value to be
> used if default LED state is on.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-pwm.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


