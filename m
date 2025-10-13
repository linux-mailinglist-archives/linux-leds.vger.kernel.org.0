Return-Path: <linux-leds+bounces-5754-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98029BD2EBA
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 14:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA672189E0F4
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 12:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D65271443;
	Mon, 13 Oct 2025 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyUCVXQO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556CD27144B
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760357439; cv=none; b=Xzh4fA0Ire7vMmNcJfvomQceuBD4kNgNAYN2XzUZhLyR5hxNXSeeJwN0uGluH9uJa+diZsFrjncJWXEFQwpD6noiRYkj17Ra12Rc1yNuhA2YN3ZMxYeX9FFndaicXZ32qVIo9xr5eW9Ij/TeWMgl7MRRUff+Vrel10rkeErKxYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760357439; c=relaxed/simple;
	bh=/UL8ClL1TChG9maoeTDyUv+AFngUHpA02X3Cek9Drfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZs4prKKaAAGfFaphc9R440uUe2Mozp/YztA/YMin6SePYHT9V8Zbv/Ch5YSQttIIReuCWEfPH5D1ZsEY382h0uqvBPSIM2yAEPQEdsDf6lUHjVEM27+b5HXrKuYjQ1Sy8H3EL+EDzredi3KyFrJcuaSw9UmMLlBRQAVb4mZuLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyUCVXQO; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-789fb76b466so3665548b3a.0
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 05:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760357436; x=1760962236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzBgszwUIJdj2pITMIqwCF2kxKK5kVVnHly7yKNXWBk=;
        b=GyUCVXQOG1fDDVqPyzjoxq7zq3QrOSd5v6YoNmiPAQk12pGZfn0KmbOXDOk7VoAsP4
         /cxocbQna34QIE1eA9Bf0rNp/3unYdIayBJ+INBR/2TGbP0EZPOl/0aQWNKdhHq7LI0y
         iUZ1VEARJZ+z/HuhEvkjjnxvMH+Px+P60C05SMMGuKrk4YjvBy12AmN27381pbG+njyt
         XiMKGXLN+ftQKbYPj++AvIChdVq2OVsWg1vcMTXxnDk7MPa8k1HiarkCIajHQQ1UoiG8
         qZj9moGhU31L5TYQw2C9DDhKZ3sjIjwhfwMMc4LowhXe3Jgvs/y9fx7IlZoBcZUZDxx1
         QJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760357436; x=1760962236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzBgszwUIJdj2pITMIqwCF2kxKK5kVVnHly7yKNXWBk=;
        b=qPSAS20iiBEpdDjkxKGh4v3nEoHS6bi66MdBLRwRXquGm0x9y7VqRdwuIpvRxA/icB
         d+BxWRFuZIZvbs31N9XDPt0zblIdaN3vAW76HokTeIZJA/hsd1d+w/SunLQHxRtvJgGO
         b+kiGEjAlgllcRC33j/R9o5GkxFcRnevC071I0LuylwlFnP/QP2EW7VSTcKV8NWXTrlQ
         FGERhzqBF9aMCLZ2YFMxDpVVgzR7WkxnuoX0UmZUOY4lE9LDsMuLK7mvTcDDU+3LCTT0
         j5pP9AIHEPyjSG3hYWHmrSYtbgmq4dedHgucvxAOA6d1Mfu1q5KsUqrI9uAz6do7cQQG
         26QA==
X-Forwarded-Encrypted: i=1; AJvYcCVIZKApqY/0jUT5lcHKLzoPYjkwLQRvM0JawXUGyp2dV5tKq3HUsfWUdYk4/pmlTUrG4sV97X+IgCV9@vger.kernel.org
X-Gm-Message-State: AOJu0YwIE1yrIQMy0DzoGx3JyokkIx67QBnaewa49qb/B+pBRU306tJs
	mX6d6JEBOEl6UlUH75fHyQyCUTUoXIv0jRcCui6374jWJ/5J5oCgFZUU
X-Gm-Gg: ASbGncs5hhVJ0Q8/Xwkv4KPSkzkCuULgTOzT53J3tee+XD2yvwXV80415McAq+fNweL
	NhXiwWcYFlfxQWpf9tjYEz2wyX3Dj8AiL9XU1HHinTJZqkJ90vo76nwg6jNEiGnK7S2dmOzxcGv
	SbnmB98RljAV3iNPkbD6c7o0qUZpbO2klukeqKVmSZWBHj0INe/Mw5Us1OLS/0HAzfSgLm4G/43
	Ah6PkPXjvOgXAKgS5zRI8VGSTyuL/z+xbfzzEvZlhUlV3Uyl06kPmi57NLCjUQlqQkzRFipwnSt
	Tblz+LYGGZkYTyeZyAb8E+SfxEBbz2ZeZn1ksy43MQRKk25zHQwbfYLY1B9ZuB6T07vJRWRMOfy
	gIGQYEzoNNqGnBHIsGhugQDLCgsGxkKWs6IMQC7rtMm+Z7KwhUNBgp2bJR73C
X-Google-Smtp-Source: AGHT+IGrfoT/bqpcaxwCJ6pm89bbGg1SBZTMeAu1UvF5nVYhh8joboK5UxNYcACKPY6tv/hz8M1NNw==
X-Received: by 2002:a05:6a21:3086:b0:2e5:655c:7f92 with SMTP id adf61e73a8af0-32da8462bd8mr27128764637.50.1760357436544;
        Mon, 13 Oct 2025 05:10:36 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.98.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df48a83sm9633354a12.31.2025.10.13.05.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:10:36 -0700 (PDT)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: led: add virtual LED bindings
Date: Tue, 14 Oct 2025 01:09:47 +1300
Message-ID: <20251013120955.227572-4-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013120955.227572-1-professorjonny98@gmail.com>
References: <20251013120955.227572-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Add device tree bindings for virtual LED groups.

The use of the virtual status function identifier allows users to distinguish
virtual LEDs from real LEDs in sysfs.

If a virtual LED and a real LED are triggered at the same time, an undefined
state may occur. Therefore, it is assumed that hardware LEDs are blocked when
a LED is under the control of a virtual LED driver.

Having its own function definition helps reduce ambiguity and improves
clarity in LED behavior and trigger resolution.

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 include/dt-bindings/leds/common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 4f017bea0123..39c34d585a47 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -63,6 +63,10 @@
      "lp5523:{r,g,b}" (Nokia N900) */
 #define LED_FUNCTION_STATUS "status"

+/* Virtual system LEDs Used for virtual LED groups, multifunction RGB
+	 indicators or status LEDs that reflect complex system states */
+#define LED_FUNCTION_VIRTUAL_STATUS "virtual-status"
+
 #define LED_FUNCTION_MICMUTE "micmute"
 #define LED_FUNCTION_MUTE "mute"

--
2.43.0

