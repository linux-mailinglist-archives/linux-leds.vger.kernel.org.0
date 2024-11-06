Return-Path: <linux-leds+bounces-3298-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4778A9BE010
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 09:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D7C52846B8
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 08:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A187F1D435F;
	Wed,  6 Nov 2024 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zu4f7KW7"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DBF1D31BE;
	Wed,  6 Nov 2024 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730880815; cv=none; b=KLHVDvznKiezgJzg4qIfkBIHsttfAAyTyoWfL3ZWu6eFnnDv8prwO+eefLia7upeTL/YdtojwDIJXLQu6GpIefLlJLSuHiLKQP0rv4euD709vq924b554j3d9M+vDJ/o4iBjJkerDcLBMO5Vp0PJAWqaMhfrGy6gjGVhz2t2OYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730880815; c=relaxed/simple;
	bh=7fTByFKlWnki+W+x/XRvQjnhf1dF4z2VG7cuiXTlMJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=APvEQhikmYmtJ/y97xLEOsOI2GS71qMre/LVUgyIJY1tghP8t5AgnALMV1XXSEnXo6hfi7DJ+kqpr5J2NV/BI/NJY48HUXRo3nPrs5yIP4phgJuWn0bRErQwapAjIV2p4J0a4O6y8TA4soQxDsDK4h/602oQdV7nly7M9DLo2S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zu4f7KW7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C826CC4CECD;
	Wed,  6 Nov 2024 08:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730880814;
	bh=7fTByFKlWnki+W+x/XRvQjnhf1dF4z2VG7cuiXTlMJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zu4f7KW7JVcsx7ZDbq497GAXthydcOXV/7w6DYXWiiJ0+Cp8Z873VRVKSqrpRe1aE
	 3J9VT+brooJJXcNrPHEKDwnQsFx1D/DXnOCQnZVGTEHGkY2E/DAvljfZ2QOon8j+gA
	 MdCaZQt5/7x32MF241IiAMliuFmDjjcFG1URlJS8FBFCw9AtC9TvWcaXlG8vZVRKRI
	 fPc5P/qRjbBhqRNM5hzQYPIG4L4BQNLwGoBn/KBqK6ppW6kvq+TIWq6hZLuuqNuXn3
	 EkFLgrSWnPrDOwGU1xGZs5xYa3q9iifIROK5lsY8DLKKqnm0xnkZPbL6jUKASCLYvV
	 Lp7tOcwE7E77Q==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <Naresh.Solanki@9elements.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241031-max5970-of_node_put-v2-1-0ffe1f1d3bc9@gmail.com>
References: <20241031-max5970-of_node_put-v2-1-0ffe1f1d3bc9@gmail.com>
Subject: Re: (subset) [PATCH v2] leds: max5970: fix unreleased
 fwnode_handle in probe function
Message-Id: <173088081255.3235523.10852876825461288324.b4-ty@kernel.org>
Date: Wed, 06 Nov 2024 08:13:32 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 31 Oct 2024 17:30:30 +0100, Javier Carrasco wrote:
> An object initialized via device_get_named_child_node() requires calls
> to fwnode_handle_put() when it is no longer required to avoid leaking
> memory.
> 
> Add the automatic cleanup facility for 'led_node' to ensure that
> fwnode_handle_put() is called in all execution paths.
> 
> [...]

Applied, thanks!

[1/1] leds: max5970: fix unreleased fwnode_handle in probe function
      commit: 02f58f97419c828f58e30f24f54395ac9be159c0

--
Lee Jones [李琼斯]


