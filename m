Return-Path: <linux-leds+bounces-3388-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 216329C4CB7
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 03:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC9EF1F23457
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 02:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C332204F84;
	Tue, 12 Nov 2024 02:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LE5gxPp/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4FB4206E;
	Tue, 12 Nov 2024 02:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379273; cv=none; b=t1eqY4iRotHZfmMhPazolJSpyNbMLfwX2/5bjjKXmXlnLFjSKThGNpJiYNIPGGI74N4MIB1BiHSZzIC9vYufY6fFUFn9lMsSWg5KtneiuERsP59OxUSTox1frR6Q5weK3FYQ4de+dYEXwXCo1WiB4BPsIQduMwobZQ0z+rCu5mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379273; c=relaxed/simple;
	bh=61Svc0+rQmVw7M2S5r3cIIPmrGexpUJc/kRDOWrrt5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cIKRjvZ54XzwNGU2NCMkGM4a/P7bghg4bK7TMbnBEjJ7DvMUcViL3+TmAF6T6EZ9uB4VLhACiqIpl+wcgzfNLxZrgKx9bgwL7S1luaPrVBgFxFS7NfgVYv9VeFHr17c3NxzRd7m9usZoFeCwiXMf5ya8efSPp9y6O2NojPLvpx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LE5gxPp/; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4609c96b2e5so33686501cf.0;
        Mon, 11 Nov 2024 18:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731379271; x=1731984071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kh1VxmpNai26o/BA2meq1FBJ6IEGdZhuB+ut7uvZe/Q=;
        b=LE5gxPp/a9bUqYIzzaBic55HEobQWgf3ZFb5YNGzuStSMrn9SxO3zXppFrnxKfZCOH
         4tggOwS3KtkBiEbfhqGbGXSkA1Y16/Eds5S/mwoMKgARG8tYt8D0CNB68Ka2X8yqPRyv
         uQIWXuyuaTruM9uko020+pCHVMXvbwTR9OYmZfj2Jlk9Ipx9vOcotoGGRDFVs4gDripp
         AKrNXZf67o8cErQvnwf/AnhI72B8+V2ZONAe/YrwGlEBZMj1ktbD27QjpgEtqzsDVMEy
         UMpqILHZIV55fvKsoLuKhEP+g8fYRRWMJqc71fgiUxClUoMzOQeL/m8uvrD5Z2gN1g9y
         u5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379271; x=1731984071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh1VxmpNai26o/BA2meq1FBJ6IEGdZhuB+ut7uvZe/Q=;
        b=EtZ+ps2xUufygmUTGrpwJmSKujBVcRSySWuiX4HI8hrxRV8g/j09gQ4ilX58qPT5ch
         7ustTkDVTJ4MgKPSQ5sqWnXAm9XD4/2KfgsuOlpKBKGTZ+dfdgxbPep/6MmuTL++h7Wy
         R5tyMUs870IfO0+a3Zxsx0hhe9kbeo+fMNBAEGo6QYnf+qDxSyMH+ztlbC7qTTM8P+XU
         0S94TookU1bUMNfXaiBnWXwRtrdQ+4z2BOAb6TP6ja7V+ec4JXNxVOskng5fi31e5BnC
         5QI3p+nYj9+wLx5HSGqr0ir8B7pD4m7qlN/6G2z+D9tPnpemcHEMfK/Xll5bD/SOSqrm
         XnaA==
X-Forwarded-Encrypted: i=1; AJvYcCUKeLlIzLRtQAwbNQGUQotntrCmfrj7GWZs+q2WV9bIRtxThTM24Gl1ItwDCEcKhweYIjY16/hKCncISA6luA==@vger.kernel.org, AJvYcCW5kDl7lRlb1Ogayc0010BJveJdPJSbtMrtTGnmYCYS3l21ksU+KEiwdnLD+0D36EoWqQpJiTvks+11Wg==@vger.kernel.org, AJvYcCW7YIoFSIWachK6TrRzsE9ac0hPYoIh+yd+VlxfRHnTEYpL+2V4/WAMcej9ityPt0svsYYO5Of7P+OK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9aE2PaQiYHS9wD9FWxSU6sIyhR82tFtXabJHHcIO/ebUMPPf1
	raT/wI1ON1MignI8GZhOePhmwAmNQuZJl3tiTV/dw15KhLABY7Za
X-Google-Smtp-Source: AGHT+IE51rk2PFrxlvXDQeP33/ge+knpVFzZtVDJZ65xqRwa6+a78XWuzhVPy5vQl7ZclGykKcuZGQ==
X-Received: by 2002:ac8:59c5:0:b0:460:bb93:4b00 with SMTP id d75a77b69052e-4630941acfamr255612161cf.50.1731379270745;
        Mon, 11 Nov 2024 18:41:10 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::ea7f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff5d7c21sm69644731cf.83.2024.11.11.18.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:41:09 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/3] arm64: dts: qcom: Pixel 3a Flash LEDs
Date: Mon, 11 Nov 2024 21:40:51 -0500
Message-ID: <20241112024050.669578-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the flash LEDs on PM660L and enables it on the
Pixel 3a as an initial user.

Richard Acayan (3):
  dt-bindings: leds: qcom,spmi-flash-led: add pm660l compatible
  arm64: dts: qcom: pm660l: add flash leds
  arm64: dts: qcom: sdm670-google-sargo: add flash leds

 .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |  6 ++++++
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   | 14 ++++++++++++++
 3 files changed, 21 insertions(+)

-- 
2.47.0


