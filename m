Return-Path: <linux-leds+bounces-4874-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E67EAE7CA7
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 11:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88684A5BCF
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 09:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D4F2D6633;
	Wed, 25 Jun 2025 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ENCC/NYt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B829B23C
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843131; cv=none; b=Uh/0jNXP2T0tLc9QZnp9zqjTYOiTZ8sqFUhAo+2Lx05UQfJD0QqmeIkvP3sp0BANNBqEULtqf4uIKSx+74GQTsExJ5mwAnuMv2XAjQjR4f4bAG1N1SVHhxkJabMNY9WR0D1u32hnjcHE7mKWYWO69fLeK2WTRSGELbvcmgm6mUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843131; c=relaxed/simple;
	bh=bKa5pgN2i6WIOfNTB+lQHR7lOH2QI72NCfvc981xeY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sciNNaTVZHOC3oTAf0GC9jXfDFaAMTddPVQLHVJl/1Q4ZdR33ovmN2awY9APk6Mr1gUrra6LCwmBYWRdQvDlPprw92PTvROltAXBfkqlVtOsIgzwcKN4Lvkl9qSbPfnoLFWaianeKRi0FzXEsn7eGPniiYRv0GsABKgR5X+d3Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ENCC/NYt; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so9544874a12.2
        for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 02:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843128; x=1751447928; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iERbP3N/EQif4yPHwjfNiSXoDkXWDN2BNOK+TFkqrQ4=;
        b=ENCC/NYtim7wD2BmaoJW7AZQp/bPvWWfcx7WMjv1lJbuytSXqzMff+vwj03zbceXXF
         1q0Q4dNhyhrcnr5DcBi0YI7s70orWarLOER+9B1xhjCMRnhNdHQXU69YsYEnhWsSKZDW
         PgVOcmLQ6ZzBMBb/UmBGCSSE5Gi8uhNBItPr0ES35JsOZu34eOcDwDP/+ZCfoCnfH0lZ
         KE2BSLgOvEQn+NB/UIEV0uselseOyjndI6KYbPO2o6xfj47rN9TvzyBiHbvrK1lH06HB
         +JYR1DtuMh8ImV6apY+ljBqvxdi0jWXA4SLwxC2eciw9tQyZ1PO8IPOWC4gsjUzi9R3y
         2ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843128; x=1751447928;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iERbP3N/EQif4yPHwjfNiSXoDkXWDN2BNOK+TFkqrQ4=;
        b=DbyuDYapVF1e93fmo34oebHVHPKb0uu4wOwWWMk4e83XvLZbNFfBpxc8geDiCwTvtO
         7Sk/GlXJdXNwC+5EeYH8hGWEgChSlcYj2QG+P/04kMYpcvmHVd1ioC/XobeOylEvRPXy
         eVMdFLLmtVvI7x9gZnKLD3ao/E9yT+jaeDMRsjO3884Bk92Lc5M7kk8QJGKXAvL5KpBf
         ZeXu0Kw+tC+TYzCfenI3lyOU25B9KbB+FwQ2/TKzGHaRVx/ufpmdT22PeRpepVXKvTl4
         1KpjVc6rqtm2y6ebHYPEGzWTFCI4xYgaUrzv8K+++6jzLVBtDYWl6wOfAGknwMUGcGnd
         83xw==
X-Forwarded-Encrypted: i=1; AJvYcCWpmvPxHlJx6lAJU0pI3jBK4gvZT1pLBmU2nY2DkODG/PI31DG08k+RxhvWyAVqwWSmZFersLBmsCl0@vger.kernel.org
X-Gm-Message-State: AOJu0Yycr1VYdFUbNQxw5FKY+vVQ/q1W8yuChrdR2yqE9bM226jerNr+
	7CKgA1RVcmtSxOEVxTlL4M9b/iraAzuJaZnwGhjeo27sPal9Ooa/39tfi+9Hao1wAUs=
X-Gm-Gg: ASbGncsnseXVSP4Fi43BEdBbbKuE7wiuDQcG199UrB/SfexzJpTM4i8rrT/Z+EL70Vw
	TaYkju5MjC05cFg01RqLyEOHW689EQ91g7BFqnBaNUfpZHRbUiCqrdJSTQPsL4EJB9Sci1LyFwB
	xsGpwvcb69ULLVuX6rZiPMgdp9vLWat+zzplyqjn4Kqmpo/86ESNlNXB12klM8dfMb2ebXTqD1Q
	OWQnMfJ3a68w1y6Ap2sU4AhimCKrb4soT0nGZek2SH3JBQ96JO23tMGlK1Mzg3U5ysqRIAOpwVh
	21qXtcD+hwoWktwBRp0Ob+ma8vOZw5P1SRI3XymC/qdFY1kGveA1fZ1j8qLnMwnsX69Aaz3tcpY
	awbGBY7gUGMzNP5TsLbnFrh43DNhrvLsvZJ6lZw9aHGQ=
X-Google-Smtp-Source: AGHT+IEcXpltZaxXDWL2kp/EpCGmt9a4hNb8S7GrsZ3BBF+s258ulShYsTeMQ8O+FZoVYQ84ZMXxkQ==
X-Received: by 2002:a17:907:97d1:b0:ae0:c539:b866 with SMTP id a640c23a62f3a-ae0c539bdadmr146489166b.41.1750843127551;
        Wed, 25 Jun 2025 02:18:47 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b81sm1029043866b.171.2025.06.25.02.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add support for PMXR2230 PMIC
Date: Wed, 25 Jun 2025 11:18:36 +0200
Message-Id: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOy+W2gC/x3MQQqAIBBA0avErBNsQpOuEi3MppqFFgohiHdPW
 r7F/wUSRaYEc1cg0suJ79Aw9B24y4aTBO/NgBKV1ChF8pMelXh8joijFERKWaOtcbhBq55IB+f
 /uKy1fnoYKWhhAAAA
X-Change-ID: 20250620-sm7635-pmxr2230-ee55a86a8c2b
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843126; l=766;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bKa5pgN2i6WIOfNTB+lQHR7lOH2QI72NCfvc981xeY0=;
 b=1UGpG1Wu5aMcFmb5bkxLYnd4bTEBVtWgll8OHBt4p//M0fVtrRD3Xak5VngDQ8WcNiI+B8Dwf
 +P4rnE9K3uMDiGKHa1GAAZddeDc/gL8/JV0P+R9g1qbMvj4xoUFLrgl
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
and the devicetree description for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
      dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
      arm64: dts: qcom: Add PMXR2230 PMIC

 .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
 arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
 3 files changed, 65 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


