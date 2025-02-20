Return-Path: <linux-leds+bounces-4037-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B98A3E390
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 19:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E14E83AAA98
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 18:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F06A213E6E;
	Thu, 20 Feb 2025 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmyOHCPL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F401190072;
	Thu, 20 Feb 2025 18:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740075349; cv=none; b=TDK5vL805kIfbNtj2ajaZz9Wcp4nK2OgYl5QwfMp8VGpkNq1HZLbdrfNqAiHtA9fcaCqyiV/IDwizS6SXYL81k5sVh+p0UOZbCitCCQP/NwJEae1I5zBsJ86sEWZbpjWAocXjK3xGdP3GnFiIsidLzCXyxo/b4krJ1cFtBT95uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740075349; c=relaxed/simple;
	bh=Wys9QJlwepm1v9SnOdbDr+MsRfT7ylIdLIDqZxLfcQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=arMK/xEy2Duz/sDchlOnnOIFAm4XRaDXL5G0eG5M2WP+6oBUstqt6jlTFXBCI9PMWZadsP3y+v8+vlCYHnunnlHe8TdxQZVOveYt9KgrsAOg9gGgJh/BW5k9DJmNqYWT/n+h+nCcWWR5EcGq/CBk2GMxm6r8c3NhV10T+H8/Mm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmyOHCPL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22185cddbffso34734705ad.1;
        Thu, 20 Feb 2025 10:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740075348; x=1740680148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wys9QJlwepm1v9SnOdbDr+MsRfT7ylIdLIDqZxLfcQI=;
        b=EmyOHCPLfcpWh5MXgMKhbm+2EnrOJcJ1IaeH3q/evtv3LhHlZqxKjoEIA3ae7753dQ
         D0ljSkP0iif5PR+I0t2Ov7YoykQtCnIfbRHcGyXShBSkYky5F030Le9P2m/geu1GkUnn
         DRuWBwSOHtS16w/Dw9J0E0GRdJPl6lBGNs0gxg63W8lPyKmSXSCwckiSWzieKRpYB3Pf
         5sOFK02iA8AbmDdIjmVznJQvYpQgiQqwKQEwqWyKZiAOSUwgHWxp0Z1VG7zthA1Mni97
         tbHYvqybZ7y/c2x83IiNqevBTBYudlR6UVHpA+rPs1B+PzQW5ZkEGtVEURwyVSbyoprw
         TY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075348; x=1740680148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wys9QJlwepm1v9SnOdbDr+MsRfT7ylIdLIDqZxLfcQI=;
        b=mTrNTXnMto6KluxHNKM2NB7C63/6cbI9cKWfzrwrzMQu8mHJkE7z4qj8P4A0Ja7ZC3
         Cpv4M2/lo45fNfmhf31l32KxlDkBewpi78/yeknsIoSF0hbEF79v2+N71NLVdsX5hv55
         cJkyK+o7q0PlnS1h780qPoHGyFg5Nm7tJtiO3tSaWVNKbR1L6qPhGk0oKvOsPEcZrElC
         sI7pvRfgQRM0wD88q+l3ZlEHOstyJXh2YUiHRVThSVNBR1BCyMt5JJv7khIRkMA32ZK7
         ZRJHYSgbbyoEIulN0oWxH83NUT/rc7TBDr36g/1lpzrixVGzqSuFpe9uEBYnLncIk8QZ
         yxxw==
X-Forwarded-Encrypted: i=1; AJvYcCV/zhV1mmC2QYJFLYXSlg+Ql2yJncDX0qudSZ+tu54eCakHTwMHF4wPLswI5IZM2BKxcJtozXrPJPqq25I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuafitmDy3mTX44DG6+E+BgyvSoLsxONg/9xbcAKjMpi6oqGVi
	IY97gSxOBCjBZelXssGXOGLc4xd6BvV9nimgZTqpXBhLBcXuIDlw
X-Gm-Gg: ASbGncuVV5NxnMG/SqB869SRT2We1/hKWC0tadOhCXESmTMtfgPV06AwlBhm7AF/n5A
	3GGe0dkDiSWONP1M2QtpiZfHqr6mcmAaV+elPEnvR/NyxyjVIXUyQuPGKUBo47uPPN+YuKmD7jh
	SEuW0G5FZfXSMD/GyncTvDszy+3aIN6inXLTuOxfkIYWjWHODtM1TjGFv8nBKfmEr8/b9RAnHdx
	VuSjc+zijL/5539OKBAXIzmyl/TQgzkqO2c7YGtBwiPJcq0VtN0wg0AxyB06w26EjCRoMhV5MRG
	gvV9nGx9nHd6fYc9Vq2Dn5piJ8vIe2HGF1oe
X-Google-Smtp-Source: AGHT+IEgWjnfefIgsoTVd8PQY1J0HjbKRI8HYOxidDm3zelm4SFoeJsjfCDC06yoM88BTtdOynEoMQ==
X-Received: by 2002:a05:6a00:2e14:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73425ca201fmr166326b3a.7.1740075347655;
        Thu, 20 Feb 2025 10:15:47 -0800 (PST)
Received: from DESKTOP-P76LG1N.localdomain ([14.162.192.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326ea62b03sm9457853b3a.70.2025.02.20.10.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 10:15:46 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v1 0/2] leds: add new LED driver for TI LP5812
Date: Fri, 21 Feb 2025 01:15:39 +0700
Message-Id: <20250220181541.2341-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nam Tran <trannamatk@gmail.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

This patch series adds support for the Texas Instruments LP5812 LED driver.
Patch 1 adds the Device Tree (DT) bindings documentation.
Patch 2 introduces the core driver implementation.

The LP5812 is an I2C-controlled LED driver capable of driving up to 4 LEDs with independent brightness control and pattern programming.
This driver provides support through the Linux LED framework and includes device tree bindings for proper integration.

This driver has been tested on Raspberry Pi 4 B using kernel version 6.1.13.

I kindly request feedback from the community to ensure that this driver adheres to the Linux LED subsystem standards.

Thank you for your consideration.

Best regards,
Nam

---

Changes in v1:
- Initial submission.

Signed-off-by: Nam Tran <trannamatk@gmail.com>

