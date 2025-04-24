Return-Path: <linux-leds+bounces-4540-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F88A9B026
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 16:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A086F7AB73F
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 14:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40E319048A;
	Thu, 24 Apr 2025 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8R0TaRg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793A18A959;
	Thu, 24 Apr 2025 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503672; cv=none; b=AsU9dhMTDwQyZnk3hcdFXEg9vNCItzOZRCFdFh7HMReTIBM/zOY0uQ1QmHCvvqBuWXpZ/37G56kfTMjVkbx0YLVETuK8dcUYusiz6VYn/+2o2wigFk9NgZQxrEjtiaPUxrvbeISpPFvUDDZtFJl5iE1ojPU/p0ZKSLRgjda/qiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503672; c=relaxed/simple;
	bh=tu0174gZgk2T8BE3vtThND38tG+YfIGUf2Yv2JI0zEo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ns3ML2U0fRcCTZrGIgIPXv1akeUXWojaNDDxxUTYnGD+1Nu7s5utnd3by/VPFiYTxDj/JbEDzsPQ2YJ32uHgiPTy633HVxTj4wlnPNf/E7M710fOKWglIeb1siZpNnlAIv+hyn3VLRUdPZq2QafUtP+OaWjkgZV5WZwWPOtcB0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8R0TaRg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA47FC4CEE8;
	Thu, 24 Apr 2025 14:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745503672;
	bh=tu0174gZgk2T8BE3vtThND38tG+YfIGUf2Yv2JI0zEo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=l8R0TaRgXcqK3sa+raVQM7gLnUbDJgmzq/t3OAEqcS83ogiF4inZHPkAHLTFqU6g2
	 r2J31LtqfhwdnxfetFp7/kJri9Qs+Eq6zjNyeZiDiugujsp0wTJVgA3hYSN1tuSfqW
	 rFAK2kktUNA0oKeFKGlh1yGbA6OGIRy5Kt/Zppaucz36M3SPvsVW1BwKUzR+c2HM42
	 lHXzlMycOPBdZlkeKUq9cWl34CaZHCFXMMkyBCtQjlhA+Jyx0kHDvnAV1qR6gg4Ilw
	 Hc3ZnI851gXYMN1tEQODjwj4MJQfk7LfH2TGpm/p8Mnb2W+AmC9RyQBQ4e85LAKx84
	 4Yz+eK3RzKfHA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250417074656.81626-1-krzysztof.kozlowski@linaro.org>
References: <20250417074656.81626-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH] leds: Do not enable by default during compile
 testing
Message-Id: <174550367064.1383657.1477555709086358526.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 15:07:50 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Thu, 17 Apr 2025 09:46:56 +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers, but only allow to choose to compile them.
> 
> 

Applied, thanks!

[1/1] leds: Do not enable by default during compile testing
      commit: eabddf599329ee21ba869b21a7ed11e1cdf45c7d

--
Lee Jones [李琼斯]


