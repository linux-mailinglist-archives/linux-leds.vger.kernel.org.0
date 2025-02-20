Return-Path: <linux-leds+bounces-4032-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8928A3DF4F
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 16:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 764BE17F5D9
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FBA200B9F;
	Thu, 20 Feb 2025 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkZJ5Lg2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34ED200B96;
	Thu, 20 Feb 2025 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066535; cv=none; b=VBYtrGuhdL/3ZeouNfvXtRddsvO3j3uypNmLAGKZIBStlwt1LxbpdgYW+yeL4EhpU9hrDRVsaI2e+rMc8giM1C3mPiNXGOTn35XWGRuwRTpQJE3cGbHt6qlJ7WuttmgGIAVcx+mOn/vLiiWuXoyX1o6pOFgqUUVsIKsp8uZqPv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066535; c=relaxed/simple;
	bh=Me9q6e/sUSWGVO1X3fCXGGTQRu6XDnXSOxFJJKhHgFo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jGmACEVCRN/D74Cg1AEFmUUk8TB5KajFaSv2qvcdASBPVPKOc8S6sJz4VRyoqGMjqUbZEN0tmzJVDrlp1rRk0tGtg0Gx+gXamYhqZmFVHeRrRxhKtEEqrtLSplKSRXK2jyv6Fj8MfVzN6xBXU/D+DlEhOZPvoi5/NBuCnUxai8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkZJ5Lg2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A21C4CEE9;
	Thu, 20 Feb 2025 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740066534;
	bh=Me9q6e/sUSWGVO1X3fCXGGTQRu6XDnXSOxFJJKhHgFo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LkZJ5Lg2EuVpr+S6sp3iVb0JPyg/ohIy/n2BeZbMNDWztM/smOMeQeSqhS4Ftq4+G
	 L7OAggpwqfF8UXhTBQrsQzKITl/9Cn9YnkHJWgk0mRuI5N9MlZVzt7WsNrRsUue979
	 0dJ21XlM60GGo0GHqMFPZ66iKAkgk2pBfZyS21kbs9fnAqkFdzQ2bTGQ1MHWPHFgFD
	 XJtdnZmDViWKCC3f4TrMs+34344RWTLY273KUQ8GGo9eMhIkmhixTIPAWxZedVBbc+
	 WCG56yHe12+V8N9hq7ipGCKCmTOQ3HLLbxHlRHVYbs94BrmCm0TnkyZ64erkKmc0Av
	 nxxajfAixxA7g==
From: Lee Jones <lee@kernel.org>
To: vicentiu.galanopulo@remote-tech.co.uk, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, lee@kernel.org, pavel@kernel.org, 
 xiaopeitux@foxmail.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>, kernel test robot <lkp@intel.com>
In-Reply-To: <tencent_3DF7518D407679C99C4CCCB1B8E64638700A@qq.com>
References: <tencent_3DF7518D407679C99C4CCCB1B8E64638700A@qq.com>
Subject: Re: (subset) [PATCH] leds: Refactor st1202_led_set to use !!
 operator for boolean conversion
Message-Id: <174006653265.831609.185737357402182054.b4-ty@kernel.org>
Date: Thu, 20 Feb 2025 15:48:52 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Wed, 19 Feb 2025 10:42:02 +0800, xiaopeitux@foxmail.com wrote:
> cocci warnings:
>     drivers/leds/leds-st1202.c:194:66-71: WARNING: conversion to bool not
> needed here.
> 
> st1202_led_set function now uses the !! operator to convert the
> enum led_brightness value to a boolean active state, which is then
> passed to the st1202_channel_set function. This change maintains the
> existing functionality.
> 
> [...]

Applied, thanks!

[1/1] leds: Refactor st1202_led_set to use !! operator for boolean conversion
      commit: 2f372a5dce6885f1d2647f7add01756bee0fef49

--
Lee Jones [李琼斯]


