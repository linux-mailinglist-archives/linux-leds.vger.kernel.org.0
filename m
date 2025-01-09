Return-Path: <linux-leds+bounces-3741-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F428A073FD
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 11:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E3CE167E69
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 10:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17567217655;
	Thu,  9 Jan 2025 10:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs5vfhFl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E753A217652
	for <linux-leds@vger.kernel.org>; Thu,  9 Jan 2025 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736420251; cv=none; b=CnTj/gXCG7HaD9Xlih4mzbFU7xmjEnqfxEqyFM0tFy9bRQO7r6efaU5gn0kO4gmXtiLJM5oPnltvOJxyIy7e+ha3Lr4A2v1tU2/yFotOMh1M+WuWrrRl19mM/KUMSKXnHwPoyiDRrXLwCbMalh2pf7XEsNUhc8z2D8xby3EnzB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736420251; c=relaxed/simple;
	bh=0oQfJkrgeyxShCEg28eMCPRXiqyxz41VV53bT5tlYFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Aqn89rjx7hTGTG3uRlIgQAM7yREFGJq7EANmWQWNjQitL1h3F58Nn/aQy7tHFnhaD90lTR4CHgl9USaPG1xs8jI822Uz2uIXsiW4kopqlu9vi69+zLC08d1UFr2Unci0lmu73d6tLX33iSuBrDuKeWBMON9ROlG0g5lgOywkbk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs5vfhFl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A113EC4CED2;
	Thu,  9 Jan 2025 10:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736420250;
	bh=0oQfJkrgeyxShCEg28eMCPRXiqyxz41VV53bT5tlYFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Gs5vfhFlGK0gxxJ08c5SqhXrRjW3fnoFB8zBWjn43h7ayQOyEezULAXnZ0so2Z3LL
	 +CLF0/0bTw5HrD7SBclh/yzbkKC/rsXrAqraIu+0+MKz85U4vUaMdlxXeHLspt8wD4
	 hN6oiFQTVDlaA8pCh4ffErZi2me+x3AOgVZ9QIOF9MGOQbwFhMLki+PDnES7HRQ3Jy
	 Xne8SfHLcwe7AUMNH+vcPBLuiK9Tl7qzW/ThSh0cKz4abMzso8UqdESdOM2mOxNCPI
	 QjjCWKC+8zZ2WKxRw1BBSKCy2Ht0u2KF3DeRJimf/HKiwn9jwEG9EzvsbaU/Ra5fUe
	 i2+JYw2wendfQ==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <20241220085346.533675-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241220085346.533675-1-joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: (subset) [PATCH] leds: cht-wcove: use
 devm_led_classdev_register() to avoid memory leak
Message-Id: <173642024939.2588364.3786876986297165354.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 10:57:29 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 20 Dec 2024 17:53:46 +0900, Joe Hattori wrote:
> cht_wc_leds_probe() leaks memory when the second led_classdev_register()
> call in the for-loop fails as it does not call the cleanup function
> led_classdev_unregister() on the first device. Avoid this leak by
> calling devm_led_classdev_register().
> 
> 

Applied, thanks!

[1/1] leds: cht-wcove: use devm_led_classdev_register() to avoid memory leak
      commit: 417cad5dc782096350e6a967ee5dd3417a19a24e

--
Lee Jones [李琼斯]


