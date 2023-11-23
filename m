Return-Path: <linux-leds+bounces-114-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4DC7F6220
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 15:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED275281FBB
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 14:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA012E843;
	Thu, 23 Nov 2023 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UI1vN4bX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4467250EB;
	Thu, 23 Nov 2023 14:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D66C433C8;
	Thu, 23 Nov 2023 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700751289;
	bh=WVecSFWfBVZt7eHFDKvJJUv63uzdwj5MUayfwitPJng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UI1vN4bXnDluSjqdzluU7xIHm1q2q0PduZMPaBxZJNaJFOJ8QeiJY2xs9hZwjej8A
	 +PbvFS5rsJlmivgH6c6kLlwfzU6HhVXxgudulfWfC2pJDrSa30qmQ831rZziWqvWTX
	 0ZTeDoyQb73HrG4lHjq1NZh6KXTWZMBa2cm9AhRBC4zXO5gZahAWOjQPKE5H3gS61W
	 4M+KsuvhlrywqvebBe9DXy3Z1A021BSGy9Gacewbag8698aktWkWy1RXzeOHVrcVDM
	 dadaNEHK6UkxJZAFziVEce8EvU2ezt2howCEwqd9Y5gCbiOKkE+yo7VgBYK2nGyQ22
	 sQUNpIgoP94DA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Flavio Suligoi <f.suligoi@asem.it>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231116105319.957600-1-f.suligoi@asem.it>
References: <20231116105319.957600-1-f.suligoi@asem.it>
Subject: Re: [PATCH v7 0/2] backlight: mp3309c: Add support for MPS MP3309C
Message-Id: <170075128649.1369133.8551722036774346120.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 14:54:46 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 16 Nov 2023 11:53:17 +0100, Flavio Suligoi wrote:
> This patchset (rebased on v6.7.0-rc1 kernel version):
> 
> - includes and updates the mps,mp3309c.yaml dt bindings file:
>     - Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
>     Note: the patch related to this file was previously a separate patch
>           and sent in two versions (v1 and v2).
>           It has now been included in this patchset, starting with the
>           version v6.
> - adds the related device driver to support the MPS MP3309C backlight chip
> - adds missed history of previous versions
> - adds missed "Acked-by" and "Reviewed-by" added in previous versions
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: backlight: mp3309c: remove two required properties
      commit: 87f33a1b8f7e3d223fc331fe54fd8ec337dc9cb9
[2/2] backlight: mp3309c: Add support for MPS MP3309C
      commit: 2e914516a58cf86bd0e42c7d3e25c81d44ec2ab8

--
Lee Jones [李琼斯]


