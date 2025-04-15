Return-Path: <linux-leds+bounces-4488-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ACFA8A4D8
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 19:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 791F8440A4C
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 17:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19B1146A66;
	Tue, 15 Apr 2025 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHpSwXAH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34517BBF;
	Tue, 15 Apr 2025 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744736508; cv=none; b=V38yxMs0mPY4oGHQrVh+felL6Mow4g/ZlY6esG+tlGCuG5w3m1EBLuRwjr0RV93QzXB7Lnr33c3m2IzIzFUzKYU8dbxzk0+1lEd0z0ntH9loaDqtc6WFRnp09oHaBpTBQoPTpGmbrBsMDb576YsfetXY4kLFC0u9tTVyg4Zmw74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744736508; c=relaxed/simple;
	bh=dFPAHZ5J7UPmzr0snTBB4MFh/2cIfkUF2ktUrfdz4yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UaQfGYcC+k56PhbyB4f8GGjKAAGFHfWN+QtzAg494etYutNbatSiU5rxILJt2kgGBvJqxVt9YKPZ/r90NHhJf2k5UqCSb6Dj9RwIRn19kEOn/05PGQbVbQV9XJt4t03LQTT6q+ekdrpSTDl43mJIUnNhmJTD2894Y+C/X91xARI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHpSwXAH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CF4C4CEE9;
	Tue, 15 Apr 2025 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744736508;
	bh=dFPAHZ5J7UPmzr0snTBB4MFh/2cIfkUF2ktUrfdz4yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bHpSwXAH46bfCBmnMi+0RdAKoODPxDEp0+jzmEDEqmvoJvz7tY1YfnugahLJOlGCp
	 0NAgiqmwjptC/u58qVj6ElVHo/vCvq8rn9AeKPrkym6xTtC2xeq3ZaSlHehQzA+DbG
	 +lo9vWVv/MTaTk92Ol+/1DOf+q4r5xINqo+NOwA6CccH5B1QbKDIy4ippDsXC96gDt
	 94wUm071yJ2MOyLMh1kf7AVJDbNL7ivmdenqwBtb6euYPx2dfkQ98ajlQxCKchuYK/
	 DGcJzLdWxkGNkDw3bKxz7xq2nEJ6ppXBeG2kbudDSP8Jvyy+ZbtzrRixUdvgShyHyh
	 MLGhDH+G44Shg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Davis <afd@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250411184708.990645-1-afd@ti.com>
References: <20250411184708.990645-1-afd@ti.com>
Subject: Re: (subset) [PATCH] leds: lp8860: Remove struct member
 enable_gpio description
Message-Id: <174473650736.3001617.15315096229164311541.b4-ty@kernel.org>
Date: Tue, 15 Apr 2025 18:01:47 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Fri, 11 Apr 2025 13:47:08 -0500, Andrew Davis wrote:
> The device local struct gpio_desc was removed, remove the documentation
> description for the same.
> 
> 

Applied, thanks!

[1/1] leds: lp8860: Remove struct member enable_gpio description
      commit: f2af52dc3d962167d39ac442b9716e71a5c3af08

--
Lee Jones [李琼斯]


