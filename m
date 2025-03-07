Return-Path: <linux-leds+bounces-4191-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE102A562D1
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 09:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 652C71895342
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 08:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC961C861C;
	Fri,  7 Mar 2025 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiKw0JZc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DA414D283;
	Fri,  7 Mar 2025 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741337008; cv=none; b=DuHo1XnSofVKUc/YhUyEM76hAvsT8rCdq9E+YFIPvar5hLUOZILocoxL2UVZfz1bdb3eBrvLlynZDWMdvRLZ+Nn77hxG8Z49tztMrKXuOp1kBBnIuSupOnKPuTRjnnlbdsBZHwTAGB/jryFl/6IYL0sPPnXPOvRWRZTARfNdGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741337008; c=relaxed/simple;
	bh=8KPJb1P6FNS1Z6J5XoclkSIqkAidbacbSyBws3+0lqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FH7QanXcuhjuFHyl0soL+7ENXoBtsPWCXuInxxmGWtqlsjlxrKclpln7Npw5N7T5VHyq6Zrea9mRs2sL4TCtt3GFAbEMe0v7oRLeiUhG/jTtWwYOgEQlF12Ie2nJ8dLvEipYApYNDJqMBHh/AnDrx6dW4sD2tszh/5ZW/Eqxz9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiKw0JZc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44567C4CED1;
	Fri,  7 Mar 2025 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741337008;
	bh=8KPJb1P6FNS1Z6J5XoclkSIqkAidbacbSyBws3+0lqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DiKw0JZcMzxRtAxmGSsSH+Rg1lbbLrhXi6dj7g8JedQntMLtKbNyZpjpZ1pB1o235
	 baQ/g7lnMYi2HSgA+QOuXA9tg7JGmwpAtYW0uLzdKd4sPqgKO88UzEdtwgAhYQS3Rh
	 DIQmHd9vCJ7/oe0QLKqcRPNfjD281+yrchlFE0PRCOq9YQaZzbdIDRLeUHkz1NPaAX
	 kbgRpIW6VO1ThybV1vS9+puaAhIgA1ByMZt6HJT+Yq7/PAb35Y27TfVvLTwUUED6r3
	 TyQYnNwrlEeJ91F2ZlN/K0tPezDp0oxZL9FKlEo53sZh//t1KU+VyC3VtCqFNgOA60
	 nfQ6ueFe2D7rg==
Date: Fri, 7 Mar 2025 09:43:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, lee@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: Add LP5812 LED node for Raspberry Pi
 4 Model B
Message-ID: <20250307-offbeat-simple-manatee-8cfa2a@krzk-bin>
References: <20250306172126.24667-1-trannamatk@gmail.com>
 <20250306172126.24667-3-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250306172126.24667-3-trannamatk@gmail.com>

On Fri, Mar 07, 2025 at 12:21:25AM +0700, Nam Tran wrote:
> Add the LP5812 LED driver node to the Device Tree for Raspberry Pi 4 B.
> This enables the LED connected to the LP5812 to be controlled via I2C.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)

One more: DTS is *never* in the middle of patchset. It is always at the
end.

Best regards,
Krzysztof


