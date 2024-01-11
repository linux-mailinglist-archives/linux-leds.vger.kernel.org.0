Return-Path: <linux-leds+bounces-575-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B082AA8F
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 10:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C28C91C2401B
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 09:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE93BFC1C;
	Thu, 11 Jan 2024 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnQOJBxx"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D500EFC1A
	for <linux-leds@vger.kernel.org>; Thu, 11 Jan 2024 09:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25601C433F1;
	Thu, 11 Jan 2024 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704964235;
	bh=qZcZgMnZ3SZ0E2Yj4KbMOhnhX7HIZ9kvPPsCh3lBXxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AnQOJBxxXGHvkmxI8hnwvJk6pGNwzmqndG3sw4KPIw/AjgVr4I87WtvVTK1Hal5gw
	 2D6YKHvsBaLaOSowMVPiZlLO3kUmxmXADxjEuNYCti35yLxuM2hzVm09is2N23QoH7
	 1ASW0KKIeZ6ndT+XnoX7EQBRJ+4BbB3aRu1tCFtwvzJ7B2BBMz+uJxArhrxqN7D8mz
	 a90jntScipKLD36Ns77F6i0a3+OQhdbv6mhcwaZNE+Kci/gY3dgv1uwztL/tciuEox
	 Djrac+xQlnw5t2Rcc7gt+7V1PqbZgAI+bxvnZBxE+5pcFHyPxsZVX8A8SWKBLa+L3a
	 z/7HV6dr1wNqw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <d3f2859c-2673-401c-a4f7-fcaef2167991@gmail.com>
References: <d3f2859c-2673-401c-a4f7-fcaef2167991@gmail.com>
Subject: Re: (subset) [PATCH v4] leds: trigger: netdev: skip setting
 baseline state in activate if hw-controlled
Message-Id: <170496423386.1627839.11437381870671198025.b4-ty@kernel.org>
Date: Thu, 11 Jan 2024 09:10:33 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 21 Dec 2023 18:31:48 +0100, Heiner Kallweit wrote:
> The current codes uses the sw_control path in set_baseline_state() when
> called from netdev_trig_activate() even if we're hw-controlled. This
> may result in errors when led_set_brightness() is called because we may
> not have set_brightness led ops (if hw doesn't support setting a "LED"
> to ON). In addition this path may schedule trigger_data->work which
> doesn't make sense when being hw-controlled.
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: netdev: skip setting baseline state in activate if hw-controlled
      commit: 5df2b4ed10a4ea636bb5ace99712a7d0c6226a55

--
Lee Jones [李琼斯]


