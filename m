Return-Path: <linux-leds+bounces-3397-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 096EE9C576D
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 13:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2E88281AD1
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 12:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CA21F7784;
	Tue, 12 Nov 2024 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJhs4woG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B51CD21D;
	Tue, 12 Nov 2024 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731413680; cv=none; b=X8svf11mYApiCPaEC8wZwSRwcFx2xOr8HJIrTOjY6RPFgCpSZmr5j4Jhz3Cqzh2GjihgF2TJTlicfKt0VVxWC2J8OyljaFIcP6vMEt6OWWFC1H2K7j+DX7OzY1fggCNPczuf/VGDfQCqdZwCX6JGKUoKe7KsVRXza95QbcQ8NSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731413680; c=relaxed/simple;
	bh=LsMsHTYl6AMDU/hdUPo9oX9DX9qQxIlfeYgnEY0ahDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iG13SsNjtlpTmPJysUylut8RL0A8AQgGFbTO9tH81QPvGTvmUu4VRgGac1Ga3gfB5GlpHKJLArvzzCSdkvu++xQfqIYm4z1UsDC/ma7AZuloxtKt16IlX/4ewmVfX18s+tHEjjLcTbizqF2O+/7IX3TDVH2eWCbVkTat+aK1j6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJhs4woG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4078C4CED8;
	Tue, 12 Nov 2024 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731413680;
	bh=LsMsHTYl6AMDU/hdUPo9oX9DX9qQxIlfeYgnEY0ahDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eJhs4woGTLyTKElyKFBsMY1g/cTgSAuccT+2DctIYfSaEFZ4lkBoypqK60BaZihSd
	 zcKgHh8ykFOJKNS+XWSJ6zY4+RQPrz8E63D5koMRKl/v42eVyKzS0+crXrE1iC7dn6
	 5L3/Px1ra/9m8aZugCnWOfGQIWYsZykI4eAvhMfCM8qkGcaDwOcs/sXan3ChjbNMx6
	 lokN6ngZaaFFb1fMpq64AayqtHASugSSuTZwh7wuJ1kaGIlEZMxjpd3SXQB3RSJ0Dt
	 xKYSqN9HchVAEbRbgECgeytfn/xEGBdkdcVFwDXsLLK2R282Gv8DnVs6/tsTc+ti4B
	 k/00Uwq72TaVw==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, George Stark <gnstark@salutedevices.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@salutedevices.com
In-Reply-To: <20241105185006.1380166-1-gnstark@salutedevices.com>
References: <20241105185006.1380166-1-gnstark@salutedevices.com>
Subject: Re: [RESEND PATCH v2 0/2] leds: pwm: Add default-brightness
 property
Message-Id: <173141367854.792236.11091462660009319394.b4-ty@kernel.org>
Date: Tue, 12 Nov 2024 12:14:38 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 05 Nov 2024 21:50:04 +0300, George Stark wrote:
> led-pwm driver supports default-state DT property and if that state is on then
> the driver during initialization turns on the LED setting maximum brightness.
> Sometimes it's desirable to use lower initial brightness.
> This patch series adds support for DT property default-brightness.
> 
> Things to discuss:
> If such a property is acceptable it could be moved to leds/common.yaml due to
> several drivers support multiple brightness levels and could support the property
> too.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: leds: pwm: Add default-brightness property
      commit: 44e04fb8d69fa7fa4ec9a20762834eab1e7945af
[2/2] leds: pwm: Add optional DT property default-brightness
      commit: 8cb08101835d98fd69cfa2a2b06146eddc057df6

--
Lee Jones [李琼斯]


