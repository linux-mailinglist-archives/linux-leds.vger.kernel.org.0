Return-Path: <linux-leds+bounces-4830-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2D8ADD244
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 17:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CF443BE627
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 15:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DD92EB5AB;
	Tue, 17 Jun 2025 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMenEqtd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689C82DF3C9;
	Tue, 17 Jun 2025 15:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750174827; cv=none; b=qBW9bYdn7DgiREdeUbO8L7pG7wlWCAalaKyF7M8C8W4+CQQryNH+hfFQYU4TsuFurw1Wg5hiY5dDauK3ECriQEC5quRu7k/fBFrs3Gct+09sLtJ0w1Npgj/WKC8jPSd4NuZpehI849a7eidoWFswpG+CU4ypi5q71I3jRaH8m/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750174827; c=relaxed/simple;
	bh=tC6/NDoju0ZefrxpCxrMvxxYc+0O2W6DOLxIX/mdWoE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uuDnE6/FqWXqIEsGOBtmrVWhEdUzpcH/uDud4xJc7a7INziAnbMKUsIMueynCLznrNh+6/wTGEkpyVV/nbqqFZcMajTmoEKFZqCcH2uDYungaJknC45UhRjDwyDSywbvPCDRXSCaoZGtEYKr1DtIH8lIV7fb9gt/UZL44WedYZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMenEqtd; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748cd3c8829so826247b3a.2;
        Tue, 17 Jun 2025 08:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750174826; x=1750779626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5k96Kr7lemrnHxQ+iFUrhM42H3DOD+3Iasxmqb+VqdI=;
        b=nMenEqtdCAVpAVzZu64s7/U31NJVFcatRzFj8FsEO+b21/ToOZskMs4svUrt3rj/r/
         Pvr6KfZAxtRCpt8wfNrqetsc1Blh8tWgxPTjBqloipPulphwPWZg3r9jblxJ+V0q2cA1
         6MF737N9FRXTRoDUMFBwAFt2NejmW+mqpOSXZJI/CHPMIkCTqKo3PgM3aNR6b+cg90lR
         PavdD2v8mIAsOpFdgZcrLeS14tfio3g4EvDyECs8RlbzWsZFH5a+OUZQJARuH+7by/Ou
         JRm9e7E8+wy8Y6EGxrBsBGBrQZuyNCsWuejhkzN4L8N+ASWvzhrar5Zd6ZMcAufqJqCy
         oRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750174826; x=1750779626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5k96Kr7lemrnHxQ+iFUrhM42H3DOD+3Iasxmqb+VqdI=;
        b=RSNp02AqmCCtwSKTTevHf3fAGeQm7ejEW73bLHRHmWAjApMgd81oMq2HZzOIlMXMEd
         trqXcdZ9HKaz9PiGbIa5VFpZYr6fy109VaG54igs3lRQiR/V1B7GiUUsyB2GPRBrVF3U
         TXqA9x0w8LCLXvfx/huADL8Y7Z7y2bGrdXY+ueaNbbPBlmJzpTdl3FzZFyfKhO/QyGwO
         fIzE8YhJp96hUJ+5fJMuPh+BdgzJOlv2W9AanT6Mul2kPIP8NyumpwU/M8+6uafaEWjw
         Pl09dLYiixCWskT+JU2oaaVkYRJvfIcOd1J8XsDsd8yurp/Wfc/mbu4m9EEaoDQdDRsj
         4zyg==
X-Forwarded-Encrypted: i=1; AJvYcCVpLrhPfvTA3skw0krayiYLksrPJS7jxJStZiikEZn0DbMxn0gTo392yawtZ2G/QKanwPlIr7WeSSAH@vger.kernel.org, AJvYcCWE9r+DSMgVxDWZnyT8uPk+cH+2K+D/3w1IjAWiEX9KAa0tBxffAr6KWeY4Fl9CbbcFlQgizes0/Fq2riVr@vger.kernel.org, AJvYcCX4wUKMMqL05hZKyiACTwFsHKuer1RZWWiHJ4Is9S0dx6aTdhNcCx6WRjPJ/8R4dqcfiAFQD38Hfcl+7Q==@vger.kernel.org, AJvYcCXHJjrvks0rhqORPnRbB3XI1gooPzk1uYiEHdFaRY57aC1KgMDf8HzimWXXNKRBtdmjlZsBsWX9JoIH@vger.kernel.org
X-Gm-Message-State: AOJu0YxENBirT0ZIOLsL03c9rEqWzXX+MYd/nP1aiwuRkwyBPc7dCMpj
	iCJJSjFwl8qyqnrHg0n0kK26sYQuh0gINXBcdGNky6VeQAqkQq9U9QJGpQS0Gw==
X-Gm-Gg: ASbGncsrbkdKTbYRXBuOesX8nbvMJJOYRMcsms8tbZXhEySObDysaT2XGRKHgX9vvoj
	wMXQrXAUxB1FGWa0PVAHKt5pNEa42v3ZwmLJqHIJM2NkdWYqOHJIEofYOmCQmP7VmO88KpA7jST
	79QAOOa84jeeahG28zsuguJFnaRjPcgusXMxkb+5ybJHH/Gn3AXVr5sGpVU0v2EhgcbhBYe32n+
	bxxJEekyun01BFXO96u32i0r1nCi47ImdkskdSzKrggRMQOFpnwy65TGbogaTQU+JmeKaqaUkU1
	GY5Vf+uMF2ah514MtsywGEpiOXBVecSbuEVtWyNsNeo0BAo0SMY5OxzTtK4NTR2N+jRHdX7j
X-Google-Smtp-Source: AGHT+IGliwIj5Gizb7rONr5DP/wCV5syb2AP+bWojANJJJURJP5LW4iLHaV1dnuIjeSmsckBuXTlZA==
X-Received: by 2002:a05:6a00:a8e:b0:748:2e7b:3308 with SMTP id d2e1a72fcca58-7489ce07d29mr18312704b3a.6.1750174825566;
        Tue, 17 Jun 2025 08:40:25 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890006294sm8993731b3a.47.2025.06.17.08.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:40:25 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 0/4] leds: add new LED driver for TI LP5812
Date: Tue, 17 Jun 2025 22:40:20 +0700
Message-Id: <20250617154020.7785-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e26093a7-2305-4d55-b836-d3bc7c503b9b@kernel.org>
References: <e26093a7-2305-4d55-b836-d3bc7c503b9b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 11 Jun 2025, Krzysztof Kozlowski wrote:

> On 10/06/2025 19:43, Nam Tran wrote:
> > This patch series adds support for the TI/National Semiconductor LP5812
> > 4x3 matrix RGB LED driver. The driver supports features such as autonomous
> > animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> > 
> > Following feedback from both the LED and auxdisplay subsystem maintainers,
> > the driver has been moved back to the LED subsystem, under drivers/leds/rgb/.
> > This version integrates with the existing multicolor LED APIs, avoiding custom
> > sysfs where standard LED interfaces are sufficient.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> > Changes in v9:
> > - Move driver back to drivers/leds/rgb/
> > - Integrate with LED multicolor framework
> > - Refactor and simplify custom sysfs handling
> > - Extend Device Tree binding to support multi-led@ nodes using leds-class-multicolor.yaml
> 
> You need to provide reason why you dropped reviews.

In v9, the Device Tree binding was restructured to integrate with the standard
leds-class-multicolor.yaml schema and support multi-led@ nodes with nested led@
subnodes. This change introduced a new patternProperties hierarchy and removed
the previous flat led@ layout used in the earlier versions.

Due to this substantial structural change — even though the intent and top-level
properties remained similar — I decided to drop the Reviewed-by tag to avoid
misrepresenting prior review coverage.

I will include this explanation in the changelog of the next version (v10).

Best regards,
Nam Tran

