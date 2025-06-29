Return-Path: <linux-leds+bounces-4924-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35922AECCBC
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 15:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4B443B6749
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 13:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67AF226556;
	Sun, 29 Jun 2025 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OES7FHWT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8A921FF4D;
	Sun, 29 Jun 2025 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202016; cv=none; b=q99Z4jkrrFBI1nwBp3vmMlc/234uCT5XgtHU7rxZr8ZxQ+HLgdNiqILCGmZGy2e02q67a4oKCTcRP/s9yrGdKoMqRuiulpqWntUW95miiJkn0aP0nNodhJBFYpxbG5Yzdh6Z9iqCESyY20F+EsokQ9a4Rm0NQCkDkwTZd98lfa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202016; c=relaxed/simple;
	bh=HTqeSsSKky9tN3QC/e3EIkj1leVwea/z1aXXKmDKd2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZRZ9xv9dBoWb3dQqTH+vAENRM96hOuHtBYTTbGsYnofGudiiRXxUZJyNfo6vaK61uOmo8j8968AlWNzOSwKttUSdEUDytBmgJZbdCQwFe1bJKXygu9dPRC2K5veMkAiFF5g6N+ao6BEv0oSs2FFC34GKB0x5KUtYshGjEJsVMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OES7FHWT; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d402c901cbso333897385a.3;
        Sun, 29 Jun 2025 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202014; x=1751806814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVrl6HRSnPKb1ylhxhE5h77W8zUj8C870Hx3TOMMukA=;
        b=OES7FHWTDnYkflaWwvjIhZokjHJAax+TajHdSsIiajXcJesqS3Nm8BZSnwtS4ATkLp
         5pddQLtoJmCtfmrX4qq6+qaR7uiPyTygfhILTeRB949QxRTJZ832Nn2QvMuEEtT3HZA5
         1CJ02Dg4hVLiJ3xu2irYxtcaRKkju3jL19airkWf/DBspDVwtM8AAPnCKgKlNOHKy7DO
         nVdID+i/V0S/oSs8skPYbCaTYw+uW2d9jRG4B42Pdkbk+Ocyh/CsR9V6r78CSpTOFZod
         9t90YHxgNWmdJ/GKDgcOBaMpoOC+vMxF0deV8poqpY/09Of+v/zNHFgJ+Ni+or+MjL8o
         0Y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202014; x=1751806814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVrl6HRSnPKb1ylhxhE5h77W8zUj8C870Hx3TOMMukA=;
        b=HBMpfIdpvn5dZGJoODOdWkOd9dMVq49YB9dvRciNrql1CQtlPF/+i+WOyJvvXW8/VD
         il3VGgbfMCYswCMoiBm4bvmFxcw2tM/a0Nb0xwyD5gLbqegoJhEwklVrEXV3Z7OcLpg/
         q7dr7E8bwDT5ApO7MMrRXHRNtVGxBFTcDZ0kLYBxeQbBo9IF+FRm1pkIJLDgPXEoVsGq
         +F31IjFdRXUh0kGFZuh1nYU2ki6OxCSZ9iChWkwIg1ubXow5bYZ4PtbkEQMIo6+iI3n0
         7ANNoZikSZXDK9f3W8bN15ROi6DK5hAVtjO80EOHvNkQ6OGMd+8jpa8Epl/u1RepO12J
         p4lw==
X-Forwarded-Encrypted: i=1; AJvYcCUbwJEfOr++rmfVwRlglY+p01zjzH7juzxzw9AS2yJo3mTBrpBXrb9VE3lttn6Mml5pVaa1Jsb27eSx@vger.kernel.org, AJvYcCXRcib0klB4PZkYTelZFXXhxMNTEmV3VEM4esuwF06m4ATNCuKB0vwDjLuLWwtEmysn2TPoHWJFhUs8v2WE@vger.kernel.org, AJvYcCXcUZoDqdMUr1RBsLLHt0LFubxjjr4l/91jG77NUknYcmYBh287izXfOP0qTGW449k+gVjub8M1lA1iKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrVAq7rRirNyizv0ptPlTdl3YN1Af/24MdHuGm74nOTU9C44+o
	x2e0jUM1tm0hzCE9xcujMrzHtAWJ6+CJxngxuRsqVyF5hrB81j+7PsIe
X-Gm-Gg: ASbGncsbYUMCQNmyMu+PAFT9/oHFYhT1agXt9RNYzfixaaHFQg8Mx+xd6/e1GIGlpga
	PeKqurSnxoyhsoYnsh2mNpfGlSH1Jh53nApYXBwpZVvep3yzmb51Xa0ja8jUFxYaUDaP8zUscXK
	4KsjQoIpH3uiTOOqlBz1aLiN5xqjIE8cUz2zk+EI8LoA8XaaMhIpO7Ee06hR3rRERMDZY9EKvne
	aaWn8GpmebgJQiGbm2rtQow8utSvpMkviKFAjQv5Ab8ZOG6/7hu0hmpnt/czsEewHpBQNFxDPlx
	wcaeUdUUBUwVzUyb1t7VpP7kP3OEwh4r2AcANfT80XH1PKKhQlH97c2pL3/ti38lDzsqaL2aKOY
	lptt93wsXWdZLqq+vxHYuvyxguPOWYZ3t3Ku4zchnkKM=
X-Google-Smtp-Source: AGHT+IFqLhtEo9BTQVj9QHz5TaaN9GgsZ03wdBMZX3J4QcBvI16MWyyJDlp9W0unUCkfBfa1pvuIeA==
X-Received: by 2002:a05:620a:3f48:b0:7d4:5abd:6859 with SMTP id af79cd13be357-7d45abd6eabmr86451585a.46.1751202013936;
        Sun, 29 Jun 2025 06:00:13 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44320430dsm433678185a.63.2025.06.29.06.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:00:13 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: [PATCH v2 4/8] dt-bindings: vendor-prefixes: Add Winrise Technology
Date: Sun, 29 Jun 2025 08:59:54 -0400
Message-ID: <20250629130002.49842-6-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629130002.49842-1-jefflessard3@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Assign vendor prefix "winrise", matching their domain name.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f03ab02afe..a3bf93e5dc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1711,6 +1711,8 @@ patternProperties:
     description: Wingtech Technology Co., Ltd.
   "^winlink,.*":
     description: WinLink Co., Ltd
+  "^winrise,.*":
+    description: Shenzhen Winrise Technology Co., Ltd.
   "^winsen,.*":
     description: Winsen Corp.
   "^winstar,.*":
-- 
2.43.0


