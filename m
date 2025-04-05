Return-Path: <linux-leds+bounces-4408-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7962A7CB7D
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 20:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 528203BA420
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 18:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60721A3159;
	Sat,  5 Apr 2025 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1O1TdUE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C121A315D;
	Sat,  5 Apr 2025 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743877995; cv=none; b=Nr/XcxnNPcOjQhMRKBRzBB1fH6Kasv/4rhPb5f9N8DSi66u5CJhoKM5HAO6mPyAuTEKQV+4HEZqs6xbYouH9+5Vwl8Rl0aGvwuz77hFEgjJZxBxjVKeFbgqmXBnN/+WPzz1/IDIG1qym9+jStk7DxRjvuQrqcfnIcEKU5V1Og0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743877995; c=relaxed/simple;
	bh=0CPJa9oneZT41Pmyab+seAn+MpmBjzC26UBHHxNVtm8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TUa1du0RMQ/kG4T49On0bOSBx1zuchicwW43CosGPGro3zi/f5/u7gNXWxZUxF7wpTytqpb3Gq9t+dMtr/dQEL2osseJ78BQfGOOTzol6eQR4ciM4gYyACEP5AgwKMKvb7h28aB+XnJjVEcu8kYkeMpGxi0eVMXWsOLZe8AsvvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1O1TdUE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227c7e57da2so26714645ad.0;
        Sat, 05 Apr 2025 11:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743877993; x=1744482793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0CPJa9oneZT41Pmyab+seAn+MpmBjzC26UBHHxNVtm8=;
        b=d1O1TdUE2+xdCkLJd9Jj6J03IQ/0knvLjEpcAo92PjHGNhjNuIKmpf90m1Kt5BY1L8
         BNTZL8TNE8Vgij024bqK4PurL3DZOqXoaHL4YhGiGH1tfP6CSFkmp6I+qOHmThCxqsU6
         GxjJRhdYWKO7JDgbZUi524gEcVaXAnRO8HoBW2Cc1sKfckNQ+MMW7HqyIVmE4tgt0fTq
         XlDgqfQbwVkDa4WDw3b4qwDMiK97i0w0fE7qEEEwK6pyfr2vgQs5IDnurpcbVXjhjsFg
         geYlPYTMU4nt+xZNdFSdaFpy4x46n1v/AY+wFSjrrDJ8qJMcVl9ysfV6roOdyMQ7SMVD
         p70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743877993; x=1744482793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CPJa9oneZT41Pmyab+seAn+MpmBjzC26UBHHxNVtm8=;
        b=V+k7bvwPAZye4SS57msYhW5PYHRlP3kcTTOWtnjppunaJbpYMc3N10dHevoglw8cb0
         NOoLMeeGNQFKLhaGqFzH8vgJkDQKr2nfiIfmfOqbbrRte2OicuVW/pQHjLMJ2PEssUdd
         An5h7tJWmrdD9OkD7uQkyZOROPKNa5TydchQOy+HyVgnttyK3DMaxP9y45UZr+x2eUpl
         +tArvnMo1oQ8f4HesiYa3QA/KMZfBTPiYQd2YPaezsJbdJTE5bddcCyRs2zpFJcUHC8w
         SplVsIqmhmi2f9nUFrEeaOy/UHWcsXOY1IaJ1rzMLLxvP41Fg1q2xj+/A0ouK6oZIsH6
         4X+g==
X-Forwarded-Encrypted: i=1; AJvYcCU5gGaPXnQM85SKaYd4IecOeVpc0F7x6ZVL9RW04Tvg/IxJhBe2btPHwIAMwyv9cVEO/x+HplqnGYbImJM=@vger.kernel.org, AJvYcCWnYdsqBKBR4TaLN7kvLKzFJlA892+4cJOu2R3gKf0YWO4QR/FAtn6BglaRfoxsHOwBw0s5Z4A2MLzPtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFAmzIP7cDR+negjzMsj84NPLrGgnk/wKZZFM/4N2KRyPRCrYt
	4ApYU4r6XlwAWCu8IclJF4K0t1HloZhqVZqkwUPvLOuRcZLjJTTGwZM5Z1ma
X-Gm-Gg: ASbGncsxGbmXbuwAShh782DPN8FBBgMbzNbIfV7vH1NXJb4FpWZgyeTIuT1AtwhGXqk
	/LfLR/BLuaG/C5y9QxI/PITtk/+poy9QcEN7pijWi6L9X4euLuZs2z3XboBAyQ1upcm8AtKa3/8
	v6yE+d0I8v+iCvkyrKFnXmwdd6Wf0V4Wa4M6MDpgK8dU6f1UopMtS/phNJc9nNffJJb6YfZOiLu
	b05ZIaYtpFpxxKpjUiq9qguVV0NTQA82vsFJki4Y3jn2ghMsjyAp13WCtMY49EgivZWNgsLx+Lq
	b1GbwzMq9pVbZ0pcQp6UmdlRrYH4RIj6JFtf0lGO2E60yZUtrRIf9Ppw
X-Google-Smtp-Source: AGHT+IFe5kLmPziRJ45/WbjSuFD9bEZeU3Orz/P3MEvOfyl7Qa43tS/OIzxkT1r5m32O3YVDgdlEgA==
X-Received: by 2002:a17:902:cecc:b0:21f:5638:2d8 with SMTP id d9443c01a7336-22a8a1c86dbmr95681265ad.53.1743877993283;
        Sat, 05 Apr 2025 11:33:13 -0700 (PDT)
Received: from localhost.localdomain ([123.17.0.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e61dsm52980965ad.190.2025.04.05.11.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 11:33:12 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] leds: add new LED driver for TI LP5812
Date: Sun,  6 Apr 2025 01:32:41 +0700
Message-Id: <20250405183246.198568-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Texas Instruments LP5812 LED driver.
Patch 1 adds the Device Tree (DT) bindings documentation.
Patch 2 introduces the core driver implementation.
Patch 3 adds documentation of sysfs ABI interfaces.
Patch 4 adds Driver documentation in reStructuredText format.
Patch 5 adds the LP5812 device tree node for Raspberry Pi 4B.

Changes in v4:
- Merge leds-lp5812-common.c into leds-lp5812.c
- Implemented the core of aeu_pwm[1-4]_{store, show}()
- Used kstrdup() instead of kmalloc() for allocating characters array
- Add sysfs ABI documentation
- Updated device tree binding documentation

Best regards,
Nam

