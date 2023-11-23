Return-Path: <linux-leds+bounces-99-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE17F5AD6
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 10:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA19128184B
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 09:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986F8208B3;
	Thu, 23 Nov 2023 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvNHvLuf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CAF2032F;
	Thu, 23 Nov 2023 09:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716E2C433CC;
	Thu, 23 Nov 2023 09:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700730551;
	bh=MGeralf9ybdkNXfCDd+XvD4Agot2pAJ6J1WgdjYYR0c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FvNHvLufpD6/CN1Pxbx/u3k5XSOf0hl4FzfIf/3QU34ZsnkRQ2hK6CGpFcA3IUcH8
	 jhH7JVV44zg2eQ7EiVJlDIenWEg9yBGJO5i+SqyxddFnZ5NMvLvmK9DWxCqg2zJIhi
	 KQzVay/4GXNGtNF8NTYDUS7As483rJhClEXFKljhohWNqycpH3Xg6wfHzX63jaNWs0
	 2VDh1tUZK2bJDMsEhtjHc2E2v5UZmzochMCOdAx4TTp72ufg+c9VNgQYz+b+t0PeH+
	 xEF3fFgxF8GpoK7bl6gI65a22nOc0GeaD+docy+HZ4/Tq4Z7kqcuia8iyh+aj+ejBW
	 z9sYNShM8A4Lw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Rob Herring <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231122205418.2482076-1-robh@kernel.org>
References: <20231122205418.2482076-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: leds: Fix JSON pointer in
 max-brightness
Message-Id: <170073054914.1187160.15361411561980210800.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 09:09:09 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 22 Nov 2023 13:54:17 -0700, Rob Herring wrote:
> A valid JSON pointer should begin with a '/'. The json-schema package is
> lax on this allowing either form, but that's changing in new versions.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: Fix JSON pointer in max-brightness
      commit: 2dc0a14846ecf85fb4de29be186581f008d197dd

--
Lee Jones [李琼斯]


