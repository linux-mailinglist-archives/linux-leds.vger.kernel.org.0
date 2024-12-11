Return-Path: <linux-leds+bounces-3566-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7599ECBD7
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 13:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BAB718886CB
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 12:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE6E225A28;
	Wed, 11 Dec 2024 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkYXQQs2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E82210F9;
	Wed, 11 Dec 2024 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733919545; cv=none; b=Er0tGqejmO5XbhjlAKkWY7re5M7cg9HanvuhGWZ4sGt5+L8CIx0Jt1ONNk1Ej8t6GVAQyqENm+6tGNwRG0CPmfbddPbqueZrC3YVW7VyXlZ+yuii75r2E0Cu3il4UAxZvXd8+MlR17LrjwMabADlBUWCtywPdqxMmMNv27xsUbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733919545; c=relaxed/simple;
	bh=EPmzPiwnVNsCM0vJoLZmRSTYKIiK2BeYdwUf/olKMFI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DWwIWOLcoLjRqT1bcbkG3fjJu3VJWeG5ZBLT9YAp+7B16n/x9mRJChrne6Kn6TJJM/+Vtz8R3S9xoQbIdD4fuv7d5C7aRQEbo/g6XyUI2Pbcyj9NOZqSQySZnUGZqU8/TB1L7LBa2Bwu6CCRboJdWj3ULakZcJjGlRxfft4gj4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkYXQQs2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C78C4CEDD;
	Wed, 11 Dec 2024 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733919545;
	bh=EPmzPiwnVNsCM0vJoLZmRSTYKIiK2BeYdwUf/olKMFI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lkYXQQs2Ep60qEFWRMR3IlHSJL0YtIoOSfGaiz36gBEC52zUJfBXL/jyYZKO7pgDn
	 YP2ZkVs0uwIpnZTB8LD+dTf+DLioa0kn9iCKzPAIx63r5FWtnk5jhBhkSfbZG5/DiC
	 vzZc8it3GJCimZl5vnG884zC6EbuV9j433m09ZJ9kLa6h+JNgtjM+/QaHVgFN0uaZL
	 qyFHK3AdNMarWGdTJA1thncH7ZaJn5ULMrCLhhxfFZ6kN7j83UMv0A/tERrrRKaJWk
	 2arDzWcoCCBFFTC6AbbWWtQ/N+nRtz1sAcQmsfLFgIj9VqEc3PUtQosjZP1V1ddCFK
	 +7eBjvBfx9eFg==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, 
 "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, stable@vger.kernel.org
In-Reply-To: <20241114101402.2562878-1-alexander.sverdlin@siemens.com>
References: <20241114101402.2562878-1-alexander.sverdlin@siemens.com>
Subject: Re: (subset) [PATCH] leds: lp8860: Write full EEPROM, not only
 half of it
Message-Id: <173391954341.776404.6679518901303711532.b4-ty@kernel.org>
Date: Wed, 11 Dec 2024 12:19:03 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 14 Nov 2024 11:13:59 +0100, A. Sverdlin wrote:
> I struggle to explain dividing an ARRAY_SIZE() by the size of an element
> once again. As the latter equals to 2, only the half of EEPROM was ever
> written. Drop the unexplainable division and write full ARRAY_SIZE().
> 
> 

Applied, thanks!

[1/1] leds: lp8860: Write full EEPROM, not only half of it
      commit: 0d2e820a86793595e2a776855d04701109e46663

--
Lee Jones [李琼斯]


