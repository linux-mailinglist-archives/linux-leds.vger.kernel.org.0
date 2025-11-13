Return-Path: <linux-leds+bounces-6092-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ACCC57CD7
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 14:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 953EB4205D7
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 13:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57058350A2F;
	Thu, 13 Nov 2025 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXoGgSTQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0A02C21D8;
	Thu, 13 Nov 2025 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763039792; cv=none; b=Ld355uobriclOIe+Fo9SmS6vrjeSpkfXyuNYIgKztGWbfm2g9yVnI4wn0DNJggvRxtITIzEXxOtkCAjXz8i4Nr87iNB4qcphvenAu8B1/o3I1LrVlzsloZiDwFggbZsjjEpbbLleB61wvpJQBZl6wjKMRQJhbuR/j8TXm3Ulajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763039792; c=relaxed/simple;
	bh=RGSgXcAd96kqffuZ9ti1iWg3748mZ1P1LuNqW+28iA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rzRSemCLIZxtpthSmHBeXJOtKAb5KcHtFN5iamgPZex3qwg3OOsorfAjnoLFKKC6CZB616XCTtNiIjlk3onTbszvWjjUWh36n+gAhOTAulR+2hNVLghwxtwbE+XZMLpEIILKQGrwLpaxbU37i/MNv0PoTLl0FW+r7wCcA1ddruY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXoGgSTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC058C113D0;
	Thu, 13 Nov 2025 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763039792;
	bh=RGSgXcAd96kqffuZ9ti1iWg3748mZ1P1LuNqW+28iA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sXoGgSTQ2ZrUZehF3hsqYiW9YNmrFbThVgHdblB3j07NMM6MM2gnpSgwXx//Pz7Ru
	 iUmLMOGRQLLiVXImrD6/P2Tnx2KSpvSPph9XY2Hv5rOh8bea3yhav8jzrMtFprZmxQ
	 NN0UDjYu1cL7sqiqaTHgMyBfkfWEzV19Mr1IVV0eZ+kVYKDYy+wtLbQAUKDDBvGndE
	 jGXhBfpMon+NxxOgjMF0wQRbzfYgNlxlKAFafJCgpH7oF4gbN59QcpeL5nJW5UvmB/
	 1Zs0TXC9ctcsRd5ihNq2OM97XmE7Ix2NwxofdfkH8cM1qetQlvFBn16z8xBlvjNH7w
	 KJHskBXtavmsQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, 
 Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>, stable@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251028155141.1603193-1-christian@klarinett.li>
References: <20251028155141.1603193-1-christian@klarinett.li>
Subject: Re: (subset) [PATCH v2] leds: leds-lp50xx: enable chip before any
 communication
Message-Id: <176303978954.1472978.16250090294402354876.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 13:16:29 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Tue, 28 Oct 2025 16:51:40 +0100, Christian Hitz wrote:
> If a GPIO is used to control the chip's enable pin, it needs to be pulled
> high before any i2c communication is attempted.
> 
> Currently, the enable GPIO handling is not correct.
> 
> Assume the enable GPIO is low when the probe function is entered. In this
> case the device is in SHUTDOWN mode and does not react to i2c commands.
> 
> [...]

Applied, thanks!

[1/1] leds: leds-lp50xx: enable chip before any communication
      commit: 434959618c47efe9e5f2e20f4a850caac4f6b823

--
Lee Jones [李琼斯]


