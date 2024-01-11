Return-Path: <linux-leds+bounces-582-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB9982AC19
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 11:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF2C21F234C9
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 10:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C526414278;
	Thu, 11 Jan 2024 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jctDkLE4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAA912E7B
	for <linux-leds@vger.kernel.org>; Thu, 11 Jan 2024 10:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48261C433F1;
	Thu, 11 Jan 2024 10:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704969335;
	bh=ET1N8FhiXqGb8CxVWx4YTVDLNOFiudyQJhMFtioj70A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jctDkLE4p0qc9DN85NJdyUWv6gSDsjq6Q6VOEcqqJ+0XasxWm2LMG74IshWipPoKz
	 EQUw6MDL3EkNAggNeqszRYHdFU2reVXKk7RBC4G6B+cjrCojlFVewFyvmbvHRpDwLs
	 pB18YYu91wLJoiByr+C0+RSuzk3mYAKr3RhuKZ7duivhkAg8udV86fmSPmqDFLz3Oc
	 L3wQrJ5GEv41buyF6RLsXpiJ7kOUy9x3LeuCZcK7RIxfR6loHwP1f/IqMS8U16gyWX
	 XKiuHJAaXts6XTZebZx97rsu7GNBIp35Ox/QVA3HzPVq0rkGn3sX9/Vbnks4bOKeQ4
	 j7CGvPY9ptVCQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <f33543de-3800-488f-a779-1fa282614462@gmail.com>
References: <f33543de-3800-488f-a779-1fa282614462@gmail.com>
Subject: Re: (subset) [PATCH] leds: class: If no default trigger is given,
 make hw_control trigger the default trigger
Message-Id: <170496933399.1669911.1331915160159987186.b4-ty@kernel.org>
Date: Thu, 11 Jan 2024 10:35:33 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Fri, 22 Dec 2023 22:32:28 +0100, Heiner Kallweit wrote:
> If a hw_control_trigger is defined, it's usually desirable to make it
> the default trigger. Therefore make it the default trigger, except
> the driver explicitly set a default trigger.
> 
> 

Applied, thanks!

[1/1] leds: class: If no default trigger is given, make hw_control trigger the default trigger
      commit: 2ee8444431cfa2324a695f964348124b5c4ca3d4

--
Lee Jones [李琼斯]


