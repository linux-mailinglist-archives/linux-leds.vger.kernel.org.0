Return-Path: <linux-leds+bounces-2508-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A624195B314
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 12:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9B511C22CBE
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 10:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B93183091;
	Thu, 22 Aug 2024 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQiRinaB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0B317DE16;
	Thu, 22 Aug 2024 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724323198; cv=none; b=ZGKnJ78iYOszla7zeCwNTQzs3uZGqSYd6ltXwB2NnOj9pcEXaT/i+By/ZguE6GXgiMX9gs1XFT7nYXj85K9N0iyI/W2+pRm1jcTOqQoPvsmE8Z4Zlr0Y+5P65NaDE3WYiapeEopCimyMB394DtCjioLx4Svq9DGy8ZEchn6r1H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724323198; c=relaxed/simple;
	bh=485sC5htGkQO+bcO6uAudwe1l+1z182B98DT/0EBhQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DIwucanPcUYKE5tNBFaHdafkwjwFLIJThnnQecBJ/esU15utr4THYBqJ5CmPU/XZzBE1MUXaKGivVIQmOSj0p+kimaR9ezbbYHiJ/Dd6LaRVXbiw3TI58fIuBId8GdzuRIoopCpA2++uEZFZhF3aTbkBFqEX7na3X8mWNPLqHEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQiRinaB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6E6C32782;
	Thu, 22 Aug 2024 10:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724323197;
	bh=485sC5htGkQO+bcO6uAudwe1l+1z182B98DT/0EBhQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CQiRinaBV9nEhy6u5Yd1esF30tlcz2TZT+eJs5cqZuQNRytLysINpr+WCaU4EVQUq
	 ZEaUe4ndARtlRJKQdRoR/wlN20gmiRHoMm2mwMZT/o3YSPlgkX+zVqXLtk2tRkbuZy
	 6BT52w5nEUqi9HfVaGsoYO2g5Ah1FTMQNEVcD3Fa+puREG8kSth6ijUIPmk7HQceU0
	 GhkREw0EKaRG9xxhWIte45I5mGfDNuV6SI9/5hi8s4GqQbyfL7mjTh9GI1UzbPZ+9K
	 XVP6n2gu4floh79DHbyk8AZ5dhSdY6C7YcUt4eWie0jkPxDfznZ/DOsThonSrFq4o2
	 006SeUe1b3KTg==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, wens@csie.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, skhan@linuxfoundation.org, 
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240816171129.6411-1-abhishektamboli9@gmail.com>
References: <20240816171129.6411-1-abhishektamboli9@gmail.com>
Subject: Re: (subset) [PATCH] leds: sun50i-a100: Replace msleep() with
 usleep_range()
Message-Id: <172432319478.1263517.9477247439443460396.b4-ty@kernel.org>
Date: Thu, 22 Aug 2024 11:39:54 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 16 Aug 2024 22:41:29 +0530, Abhishek Tamboli wrote:
> Replace msleep() with usleep_range() in sun50i_a100_ledc_suspend()
> to address the checkpatch.pl warning. msleep() for such short delay
> can lead to inaccurate sleep times. Switch to usleep_range()
> provide more precise delay.
> 
> Fix the following warning from checkpatch.pl:
> 
> [...]

Applied, thanks!

[1/1] leds: sun50i-a100: Replace msleep() with usleep_range()
      commit: 8f3f07517834382e819e168740bf855273f13d47

--
Lee Jones [李琼斯]


