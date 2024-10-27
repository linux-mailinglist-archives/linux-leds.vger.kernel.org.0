Return-Path: <linux-leds+bounces-3177-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5C09B2063
	for <lists+linux-leds@lfdr.de>; Sun, 27 Oct 2024 21:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F289A1F20FE4
	for <lists+linux-leds@lfdr.de>; Sun, 27 Oct 2024 20:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5346F17BB3E;
	Sun, 27 Oct 2024 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaR68WW3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD3762E0;
	Sun, 27 Oct 2024 20:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730061220; cv=none; b=WUHycI0puf5WdAnrkiMYsbYyGULY+ZIqyUYg098/SuNSioGG8NbN9C9r4bNDIS7bGE4Rk7FPBbvowr9BKIsdknneSzmexSZq64/YdbGiNPt7WoXcWpCU0W4ruBIx8qHGHvsdOuZV3glac35sO7+DVgskSH1P3M0026gCHlaXERs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730061220; c=relaxed/simple;
	bh=MFhXcuwpqZcUp1Hi6m3uZJlGW4HRA6hWyU6i0KMjz84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S583G7MJDSi+Z7mkmkZdyLbZL5xWvwP8olp+0yaYz28rl/pB7zXwv1xVHCOoqiUtWg/gWOq9XfWoPkNuahmrQ3arnVQE9pvvEhzgeMtMmDMcFDBAKSpWgjD1d9JuY4oZEmQgxtY1ORxro9kjcmtv+4axo/6REzM9yJwg3MzTiHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaR68WW3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AA8C4CEE4;
	Sun, 27 Oct 2024 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730061216;
	bh=MFhXcuwpqZcUp1Hi6m3uZJlGW4HRA6hWyU6i0KMjz84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jaR68WW3jWrqKdLWrdqJAv7GdgFfybeeO0ABT3ZYiY0+KKYIJYCZy0dh9ZbxHFoQB
	 HCXvRa5MokkDZziRrkaUJYKNEYpX/RSWqC7/BwifSIcFdb4ZMoxHxpBVy3tAMxMlzI
	 NV9OU3aJmxbBfoyYFphziQ671zuck4JxIK+q0UlvMWNJql32TeL+dqsVLlTDm/WNeM
	 GjlDX8yUnfxPWsn8S6UnAxVndovoGDqn8sE7NKdsHb2lWy/DyYR0VliwgsSbk/Vjen
	 NvAOlE5sJp2thowc2DaJH5FdP8uPNqXYNG7ZfJHuRcoJlB3QgZY26wk/KY2bjFtYmo
	 XGmBTOI3QzM9Q==
Date: Sun, 27 Oct 2024 21:33:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <56dut7eh7w75uz3mvl446uc5qpvyuogbyz55clmdaqez5noo6i@mtl43zjfkqtd>
References: <Zx0AqwUUchl4M6po@admins-Air>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zx0AqwUUchl4M6po@admins-Air>

On Sat, Oct 26, 2024 at 04:46:03PM +0200, Vicentiu Galanopulo wrote:
> The LED1202 is a 12-channel low quiescent current LED driver with:
>   * Supply range from 2.6 V to 5 V
>   * 20 mA current capability per channel
>   * 1.8 V compatible I2C control interface
>   * 8-bit analog dimming individual control
>   * 12-bit local PWM resolution
>   * 8 programmable patterns
> 
> If the led node is present in the controller then the channel is
> set to active.
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> ---
> 
> Changes in v3:
>   - remove active property
> Changes in v2:
>   - renamed label to remove color from it
>   - add color property for each node
>   - add function and function-enumerator property for each node

Where is the rest of the patches? I commented previously that you send
them in some odd way messing with reviewers MUAs and lists.

It seems nothing improved. Follow submitting-patches and use git
format-patch or b4, where both handle it correctly.


> 
>  .../devicetree/bindings/leds/st,led1202.yml   | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yml

OK, so you just ignored entire previous feedback?

NAK.

Best regards,
Krzysztof


