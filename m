Return-Path: <linux-leds+bounces-2267-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E295292EBFE
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 17:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F330286B5B
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 15:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7686D30B;
	Thu, 11 Jul 2024 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxXv5j+q"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C010B8479;
	Thu, 11 Jul 2024 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720713098; cv=none; b=EzQ2CCySC0Cv/+QXzW8wVhAfXSQiL68Ig01a7OJDxIQ3RMyahrbB59yzpQ4QDSQfdXt0xqDMjQYeXqXPULpoB8Mvz3g7dICuSBA9rXJyFq1uJA44qPuvZbQEJmRxbSakMXHQIAJQZCu22EkQSENk4c9TdJcaVn9HiFR/zCDsrFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720713098; c=relaxed/simple;
	bh=rZlAdbfPl/AhPJ/0m/ItBHbt4Nm/jHmfF1P7tl3ao4o=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YHEDBRM5rK+6emu6h5tx3Dki9vnJDjrOu3t+irUafPMZ/uQqRh7k+Rk8yPIUngZm3pJr1lmfqIGDdhyL8lm9iJM9WWtIbe77PigAi0OusjwSP2yWIltHXc0qVgML1qXdZBAZeoqblEQECQ0Lv6US2ifmboA6nsX+rvI7GhtEcWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxXv5j+q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F70C32786;
	Thu, 11 Jul 2024 15:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720713098;
	bh=rZlAdbfPl/AhPJ/0m/ItBHbt4Nm/jHmfF1P7tl3ao4o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HxXv5j+qkoq7J0EJEgvXeYn9BksPEkqERT+q/JLBfGptXRC2kwdh8EyP0+wxdlTSd
	 Nmvpw9Jh9s/XqO/Ehabx+Blkz6Vlzqi/tAvSGo8yYrMAGCsZgT4/cRletnlFKy/PsM
	 yq9LwO50a/2lSEGTmkHBHv0eHLWM6synMrrYk0e/fQ4Tx7skoMCHWD1do17mCWgHHJ
	 Ij7n4omlL/VLxdYf4xXINbRKqlzzfjU8iSRyKhgi/DbmtNLqZZ0AICdKCNokoqRQR2
	 DJzecZYm/Ocd1EL1W2ml7ASwT1FcIyxbXJS6vrUr7SEoyGwU0xpDrAQ8ZuBR5vBm5X
	 8Wafx3chpNJ5A==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20240704015543.14495-1-ansuelsmth@gmail.com>
References: <20240704015543.14495-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH 1/3] leds: leds-lp5569: Fix typo in driver name
Message-Id: <172071309710.1881063.10513199797571029874.b4-ty@kernel.org>
Date: Thu, 11 Jul 2024 16:51:37 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 04 Jul 2024 03:55:40 +0200, Christian Marangi wrote:
> Remove extra x from driver name as this was a typo from copy-paste
> error.
> 
> 

Applied, thanks!

[1/3] leds: leds-lp5569: Fix typo in driver name
      commit: 16748df87358e3addc54135eb0106139d1acc104
[2/3] leds: leds-lp5569: Better handle enabling clock internal setting
      commit: 2aebbea1864a0a920d8b5c9324cb2a46665972e9
[3/3] leds: leds-lp5569: Enable chip after chip configuration
      commit: d9cc80b1c9b40a33c022e125b7f9555813c7f385

--
Lee Jones [李琼斯]


