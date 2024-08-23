Return-Path: <linux-leds+bounces-2519-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7395C6BE
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2024 09:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2DD71C2120F
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2024 07:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903B613D510;
	Fri, 23 Aug 2024 07:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHESa5Z+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037613D2B2;
	Fri, 23 Aug 2024 07:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398873; cv=none; b=FCvEtjjC+64EnbQg63K70mcGgcnR5NiuGvvLh7GbwjvCuuOJbZlHIkBvfyqpCIiZ70PfhtcVfBzANGy7hCFoMJ0PIHITUfBXe3oWVg5+K5kDXUl/DZD4dhfMZ7Y32yzO1aPYdHKteDurztC7/wlq/vO7hnUsSXCLGnIMA2xgz0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398873; c=relaxed/simple;
	bh=LEc7ufxrhcN1HJyOFVCDMFftQ/9roKH6uSCkqJjLpTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d7LRjHsWGTj4wmlLDKUw7lYplK0fM/qEXfulgwrSv8+6CpLDW8HM8n3KDLmQHlKwkAruI5bfIUkdWpReL+wOEn0st57bNtHRllP8DMTwphbYH/L8lmJUgR7KP4JauVSyBjBmQ2XKsMnlsxR+BFu7es/ka2k4JOLzV5CCFLqB+B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHESa5Z+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9119CC4AF09;
	Fri, 23 Aug 2024 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724398872;
	bh=LEc7ufxrhcN1HJyOFVCDMFftQ/9roKH6uSCkqJjLpTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sHESa5Z+d3l7GDV2fNjh+qgxKYmZqE6RurfjmM3jEXLZcW9/ASaV+Gr+cYwMosrZp
	 JGbtZ21BLwHRCsfTnynFDSs7NwH7/4Pr5h/jtLgaKXRJV9JWtbkMPZZRRMZT309FK6
	 7TKEKvNMXk5VUvcuGTNibiAmoLF2gbJGLHui1fqHOLIwGdF8TUmSSKoV5bVZPOik+I
	 bh2JXx+HAPi1DiDdRnHXFWcmVy0DO1ebNYnwTKquSXFqYAVeeAeEU5M+H3ygSn4iHY
	 8k/+pN9wvzldkcZ2RT06khidd5ReYWo4Oe67hvPrjqnHuhveRfw31xixaTEKe1rOMv
	 OPx23M0XlyNQQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20240716212455.work.809-kees@kernel.org>
References: <20240716212455.work.809-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: gpio: Set num_leds after allocation
Message-Id: <172439887133.2069692.5497848773911564354.b4-ty@kernel.org>
Date: Fri, 23 Aug 2024 08:41:11 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 16 Jul 2024 14:24:59 -0700, Kees Cook wrote:
> With the new __counted_by annotation, the "num_leds" variable needs to
> valid for accesses to the "leds" array. This requirement is not met in
> gpio_leds_create(), since "num_leds" starts at "0", so "leds" index "0"
> will not be considered valid (num_leds would need to be "1" to access
> index "0").
> 
> Fix this by setting the allocation size after allocation, and then update
> the final count based on how many were actually added to the array.
> 
> [...]

Applied, thanks!

[1/1] leds: gpio: Set num_leds after allocation
      commit: 045391a02bd971d431c83ad03f7cc51b6e2fe331

--
Lee Jones [李琼斯]


