Return-Path: <linux-leds+bounces-4275-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65203A60FAA
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 12:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53DED1B606C9
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 11:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADC51A5B82;
	Fri, 14 Mar 2025 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmwVvKlp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4687C16F271
	for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2025 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950721; cv=none; b=iBk8SzCLGaCBlGNddk1XPptkrEgiv3QN19fBps7S5acyZGO7A3P7xcgn5UJDsChPZJPUX+5YfyjmHyThHXbsGf4i2ua6UjieHEB5D3bBzivORiknGeiGzqJV6GfgBtV9FExZbbzZzF/R4rVRffEfqOal3ciM2Gm0vyo5cP88tf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950721; c=relaxed/simple;
	bh=pSjvaAVl6aEDeF/cQYBPwpPmWTAqGVjgwkrKFwifLOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFUdIVhAZuZk6DvIWE2t49sBOcr/0BaKurapzrXu1TbiFePJPvWKFhdN62HjGeOUdCPO24OmPRSkh0VRAbixVXqX2wZy9DBnhzzhZDkhYbh86y9I8P0kC82GQ3Q8Nbnqah2t5j0EErjkAmhxu29bKQHNGKbk2oUJ+VaHGWuIVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmwVvKlp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5CEC4CEE3;
	Fri, 14 Mar 2025 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741950720;
	bh=pSjvaAVl6aEDeF/cQYBPwpPmWTAqGVjgwkrKFwifLOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmwVvKlpHZc9tPMIGQIsdKuy6fBmz1nT8o+AW5FVnuxOx2hHeO3EE/0RwjhsnoS1o
	 tGhMFwIA3dwEKtFeElV8fj0t+EgOX/Gs7vWdgPRpoahASuaC43PuW82eX5NoDZe/aP
	 MvBrmxsWRZ/Vx+sBBFkhbWkEkb0OYtd7j3C1HPQvLnTXhpmA52FFk/m9xGpn+d/ibc
	 1pRcbIxAO2xXk9ocbRh3jt1F49iUwDGhXmj74UW46PKtDZUm2IiViuqCpGfA3wi29H
	 Gv9eceylXM7bYVZp0WQISHcwWKGFCTBy1y7HI04fhuQIVsqH01JWXfuOQVRWXeebZN
	 YiezSEgLUdj3A==
Date: Fri, 14 Mar 2025 11:11:57 +0000
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH] led-triggers: accept "default" written to sysfs trigger
 attr
Message-ID: <20250314111157.GJ3890718@google.com>
References: <20250306225524.318562-1-craig@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306225524.318562-1-craig@mcqueen.au>

On Fri, 07 Mar 2025, Craig McQueen wrote:

> If the text "default" is written to the LED's sysfs 'trigger' attr, then
> call led_trigger_set_default() to set the LED to its default trigger.
> ---
>  drivers/leds/led-triggers.c | 5 +++++
>  1 file changed, 5 insertions(+)

As before.

If you don't know what I'm talking about, check your other mails from me.

-- 
Lee Jones [李琼斯]

