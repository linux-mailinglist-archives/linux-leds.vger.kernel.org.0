Return-Path: <linux-leds+bounces-778-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E5C84DE2C
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 11:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8666284415
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 10:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7406F530;
	Thu,  8 Feb 2024 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7nv61i6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC566F51F
	for <linux-leds@vger.kernel.org>; Thu,  8 Feb 2024 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707387756; cv=none; b=WhkJCNrMN2PXp9UrkzxC82ZcI0sxkVADpvjmpyc3+hMT7oG1WwWtEEQrtMgmKI7OVionOHT/mJykz8igXQ9R8lMtapGLipYQIYwS6fDbuBvXv4rHGSMIGZVZLeV3x2GUrF5auV6Vm6LhW47BK6cLmD0DRMb7MQjuOJQxNNcbh0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707387756; c=relaxed/simple;
	bh=xEM3FDBwWe7fq/Dk8YMvNsIKLc8t2rFe/b19BnIvjBM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kvx2yOxU7SR5y5xvyDisIYNWwlUdtJX4Z6JjFRBdvEe1hst4xOu16j/7akt7IyFDdyGMCbWJUUOs4KPw4p4wHwDCoC4PNHNfZgFWNxZLXxYkaZAWzN+wnVP/B54T6hvrIdjDVYD345WbWhT1r4zinn1qB7sgF54uULqomNLcu9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7nv61i6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76599C433F1;
	Thu,  8 Feb 2024 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707387756;
	bh=xEM3FDBwWe7fq/Dk8YMvNsIKLc8t2rFe/b19BnIvjBM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n7nv61i6SwLmx7V1St7wpTrGR/C47hvWYbIYMcnfFh0sZt16BQcf8ych/Ka8yrf8D
	 98a/B2tEwLUyp+QQTasz982DZuTShQ8LnuUGqeo0tZyt6aS0+BRQ2ZaRkdha8vAVIT
	 HAwgNd3A0ZSINIQxMQgcRDTzPJ+DM+kIZ396jagqFF/Gzx6iwP+4YcmP4GNqLDxtVm
	 BhfUkTra0S+joiJ+/07LIQ2lk1d+f4qUdqAV6rsoYOc3ZoPmr91L9KVLE4MxznDdRq
	 qEPpCR7dDnr32JulPhDX35C23QjOvn/ArSwocZ8xtrJEI8e3GJLBRACfrsSodPTGrL
	 rJws3l8fZUJLQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <ca185fb1-3a66-46b9-920e-bfecbe39c6bf@gmail.com>
References: <ca185fb1-3a66-46b9-920e-bfecbe39c6bf@gmail.com>
Subject: Re: (subset) [PATCH] leds: trigger: stop exporting trigger_list
Message-Id: <170738775519.907987.8656098604510646583.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 10:22:35 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 31 Jan 2024 15:30:53 +0100, Heiner Kallweit wrote:
> 682e98564ffb ("leds: trigger: panic: Simplify led_trigger_set_panic")
> removed the last external user of variable trigger_list. So stop
> exporting it.
> If in future a need should arise again to access this variable, I think
> we better add some accessor instead of exporting the variable directly.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: stop exporting trigger_list
      commit: 6171582edb46889769d994cca81cf0f0fdd8c66f

--
Lee Jones [李琼斯]


