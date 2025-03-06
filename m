Return-Path: <linux-leds+bounces-4174-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796DAA552DC
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 18:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EAEC3AE417
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 17:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054A425CC6D;
	Thu,  6 Mar 2025 17:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqK7Q1HO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2A25A627;
	Thu,  6 Mar 2025 17:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281696; cv=none; b=ulGERms+/a708EgKZkjIRe3tADYQqNx5KLzd5bL/zvjNocCnjqSnHmmA0BoXEnUqDoi8TFpROjkcLEl5uxnDy10W1/tSZZJO42q0BQloI+tnzVAJmQVNWuad1Y2dGcAJK2xwJXzdMrG45NN1mJczl1XLm0WeJy4q3P08k79sEkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281696; c=relaxed/simple;
	bh=vuF4uyZajwvR4CFn3hV2Tys0FhFnloVWMh6VgbjOGAU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IbY91x8ExJ9V3CX7IKeenNMOVX3gj752jb9i1UkKHkUS0qtsPLpfrx+p+kvttjHsqW+3PNrGTvHNuP2rGwc7PXfrWNodadUHCZ5CJJr5nQvI3CB11imPRS2y5teYANVg/Mj+f1ap4fsm2/w82cziqPNZhkNvRfcNAHNmbKSUdeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqK7Q1HO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223785beedfso17284785ad.1;
        Thu, 06 Mar 2025 09:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741281695; x=1741886495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vuF4uyZajwvR4CFn3hV2Tys0FhFnloVWMh6VgbjOGAU=;
        b=YqK7Q1HOR3D7y01TEoNMXD8j7V98v8T5JyFUT7UtPK3hfWYkWVw0piheoyHDqJ21Dd
         hy4+jPWlUSEL4BYnQqOiyr4SKTBDwoMtLZG3Ba8833M4t8Z1pau5xk2G0MfwGGKY34dW
         QgyZEOZFWrt5+tfbfgA/XhSwUxlGrwUM1mvl9IJlUnFnepHk7emUjvsqIuLp1WY5/HGt
         ZLwW8dMMcTaP1BJBXF4vB4bPo/NwLlb5c+KLhHUgmoa5EDDXguoHIZwaHAu/hY6x6nCh
         JoNBJ93k9LmKsITRGiY2McQh99LklJeYeatK+AC9jSudfP8Ns4vOdnJ7mnaWXkD4owYp
         WwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741281695; x=1741886495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuF4uyZajwvR4CFn3hV2Tys0FhFnloVWMh6VgbjOGAU=;
        b=VAI7HBl3ETkmMaclVtLl5pUQ8qcNoZvH4FXDwc9hYQq/9vJ3GU8urAr3iszpjrD+32
         gZPSuMyOK+XszD7JySqAXiFBn6pHs+RzbsGPhBhsWF788+SgxBrnCsUlEtlSj2h9nx+B
         bVFIltOW7smxSJ7GeghOPLBnW+0SY+7SoAjuuEhhfkZJYRDtUgz80CqkGozQ83t/+8oB
         FaHx0LjOGtrMJDgaVmfFhCc3q7pG2shgC9aNMqroGFIhSqTF5dwmAAucSjSXT1hDOqHP
         D3vks1z7haLcIARJVmuMy8G9YQBbvd1HCV8/zG6dUZ8EqrlW6982qDWFlTyINsDbUN8o
         XWJw==
X-Forwarded-Encrypted: i=1; AJvYcCUWKjjr3dN6+yIQlvLQbp5AtMInfNUW4zXSfMRDUiX48i9MEJJBelPc6BNs+lubV6eYWQ0ovH+OMi43xA==@vger.kernel.org, AJvYcCXVSqvDhj2HxKdlzqncIfhF62v3GdpRTaBlOLfkBGqllNR+9cLBwyDfN5Hug/6660kETwkNefNQI5avJeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFQFxuOYcpyqIYIJhEyHdPTeCFOmIgw7wMkBmiKN5DMeArlea
	domLJRMyHRX+pFFJvyjufjVuIyDpC2Ey93i+AqxPIZWMqhjFfH4lhrQXWiCa
X-Gm-Gg: ASbGncvJEJOh5qHbZ8WAcRmPNxueNFDjKUy8mLIuMLhhqatxWhX2S5vuCqH+Iv1y67x
	UoUpW7ixQwzJCG9OTLGJoHCRTBgUlYZJIo1xw1FjgbPqjopWIybd7WvKJeVjvEHBuBG1GJ8kCGY
	4PVUA7y0EOpZIdzI3ywPZQKiR4ht1AA463JGTIHdgapYoYIexLm+2AaFlpEd08cnRcvdleXkvsX
	Z9Xa8NiwpJOlb+U3CMHFHk681yHbQCRYnswJTWCGRt8TJ9kshlJncZuFvvVxmVqMpMVt2RMTSwJ
	50Rh2QgDaqI5vrNPKzhumNXx0/0DdNTWXQFhEsONce9jERMDJ+RtLL5fMqU7SytnkQ==
X-Google-Smtp-Source: AGHT+IEUn36ku7iQxq3qJ4CuSrWPoX5y/kwBkhKYGkTjHrcYhnTln/kKvK1bidujUGGAonf+D8E9aQ==
X-Received: by 2002:a17:902:d48f:b0:224:2715:bf44 with SMTP id d9443c01a7336-22428a96909mr1067465ad.19.1741281694723;
        Thu, 06 Mar 2025 09:21:34 -0800 (PST)
Received: from DESKTOP-P76LG1N.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd627sm15103375ad.50.2025.03.06.09.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:21:34 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] leds: add new LED driver for TI LP5812
Date: Fri,  7 Mar 2025 00:21:23 +0700
Message-Id: <20250306172126.24667-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nam Tran <trannamatk@gmail.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

This patch series adds support for the Texas Instruments LP5812 LED driver.
Patch 1 adds the Device Tree (DT) bindings documentation.
Patch 2 adds the LP5812 device tree node for Raspberry Pi 4B.
Patch 3 introduces the core driver implementation.

This driver has been tested on Raspberry Pi 4 B using kernel version 6.14.0-rc5.

I kindly request feedback from the community to ensure that this driver adheres to the Linux LED subsystem standards.

Thank you for your consideration.

Best regards,
Nam

---

Changes in v3:
- Addressed review comments from v2.
- Split the patches properly (DTS separated).
- Updated DTS example based on reviewer feedback.

