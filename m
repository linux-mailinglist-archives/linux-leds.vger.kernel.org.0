Return-Path: <linux-leds+bounces-2313-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD75D93BF98
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 12:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B1A21C20A96
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 10:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0B1197512;
	Thu, 25 Jul 2024 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/9wmXkd"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E491386C0;
	Thu, 25 Jul 2024 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901894; cv=none; b=go4cyUw71PSOt+KXiCAeS9ctNKHdLX88xrEfvNNonF+XPZZo1axyeVBHlF0UacQRb1h9G3Ae3xwxjQ3ewgYjfuKP9fMVuJYsKb9wwbqikotMk1OxgatUi+vR2uUR5LzDX9A0Dq0z7pTHVlu1bQHUdoBWRq8bJKOf03qZBznU43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901894; c=relaxed/simple;
	bh=u7pV7NElKnmUMJWdTaw+zlZpq3bES2APAnsYNWn6Hy4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LxMBgnD0SnP1zdyp13WK/qaipSJZ12fraybj9Iz/fgagaROTKCb9ESBDj9U4uuhp1ZqiJ27mv7VfIGNRnWeMmmnBNP9PPGMAAXEicRXSfO+f17YPHZ2UP6pMRlukuDTwVuUF3MM7ZZit2MtYsbVtxNy7ZHwJ633aruNv70fboiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/9wmXkd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49475C116B1;
	Thu, 25 Jul 2024 10:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721901893;
	bh=u7pV7NElKnmUMJWdTaw+zlZpq3bES2APAnsYNWn6Hy4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u/9wmXkddUt1XmdPrFcHoGxeKXY15Z1FY9uF0A71X19CdomGv1vJ4Ihp9j0lRTwqV
	 aJjLAnMZGQdiOjQ0pvzGaqE7b8NpWcw5Lb13BaRe7QFfS7rV5j8rVO3+VvNjlQRP56
	 9lhNIyzXmv1KzZxm4sOOLg6IN3ET1K03SSAABD83ETOjk9WqlkJZRpGMXYue+PHw4j
	 YGJxAxT+rQmNy9Of3/okjXDgH/rx6re88xnv9LNYuEI1skJsxzsxbYRADnfVLLOLUo
	 L5OvV2DIpZmJTLBWABarXsz8IukspxitSJosgKhO9kCxJ0sqr4PPzMGZ4Vtu5rDKWB
	 3JuWkwt+S1Axg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>, 
 Pieterjan Camerlynck <pieterjanca@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20240711-pca995x-v4-0-702a67148065@gmail.com>
References: <20240711-pca995x-v4-0-702a67148065@gmail.com>
Subject: Re: [PATCH v4 0/2] leds: leds-pca995x: Add support for NXP
 PCA9956B
Message-Id: <172190189103.914325.6698687075285960165.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 11:04:51 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 11 Jul 2024 14:49:49 +0200, Pieterjan Camerlynck wrote:
> This series adds support for NXP PCA9956B to the pca995x driver. This
> chip is similar to the others but has 24 instead of 16 outputs and a
> slightly different register layout. Datasheet available at [1].
> 
> [1]: https://www.nxp.com/docs/en/data-sheet/PCA9956B.pdf
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: leds: pca995x: Add new nxp,pca9956b compatible
      commit: 249eef903047c9861823072a918fce7d2b8a94b6
[2/2] leds: leds-pca995x: Add support for NXP PCA9956B
      commit: 3981b88ec586125d323cacd6734211071ca43f36

--
Lee Jones [李琼斯]


