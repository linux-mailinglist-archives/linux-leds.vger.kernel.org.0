Return-Path: <linux-leds+bounces-3131-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4C9A5080
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2024 21:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 727F81C21966
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2024 19:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A9B1922C9;
	Sat, 19 Oct 2024 19:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C17cE1ly"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365E4191F6D;
	Sat, 19 Oct 2024 19:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729366621; cv=none; b=KpWK5XoFe4OlAXAoGUXPxryHGMBocFigli/I82NsfZOfTt2Z6jCkmizu2Q1ncsW5rqa6CfyBOqgZ/Cd6MEQszeOm7QTt79xPlZUorcWNqHZcKo6piNRq08vvNZpqg8BRcj2WlDAScqAzIZfXwhx+DDfiWY5xmq3CjPyNPGM8bsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729366621; c=relaxed/simple;
	bh=d2oOgds9qTucMQfgdKlCsqg43R4tHX95tUjnF2Qs+jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2jAHfAiNwj41rX3gn+Vka+rKzChxmZU0ayVFmhlZU4Cis+qnPW93q3jyuIYLPXsWypsus9yesIhdLYb0hbNWIW5++COYvCmc2T/oLiEH3fX+C+ItfQL8hnm0QKi+NSjRZ6jNB+UyFlsDU6tKLdSnC7bSJrc3WMsXWlXCbtYIYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C17cE1ly; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso31016145e9.0;
        Sat, 19 Oct 2024 12:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729366617; x=1729971417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8wry6chqZgKtIaIYCfOGXTh6+LfqDb7jBZtpUnJzzA=;
        b=C17cE1lyR+1Nm64D/ApQhzy5GlZcG0OQawBIg+Nw8VqYs74NhltWEWbSU/4I3MXTUm
         o+E6UgnmjzgRa3hXbryhaKchNFJmjNPoDvkilZcPdeZWDI5n+oo6oVD4p3ujfnKhIA+l
         G1ppu5oWuAIsY3yLO9ZkHd+c42KLYMPo48K3Rst4KL4kTwYgFdtyyFgw2J1ltC3Rq0sf
         oJtNChpIf9GNuNAqLvY4ROkaolIO07ZlDshe0fBYJKMOhzTGPTOz6Q/u/RMEF+AbPEjE
         VX6vvJgUxbu3ybxVmSHdH1OAt1vPHV+p/nPQ+2Dy6T9SX8v0A6Tb//cSuS84JeCMd5gR
         LRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729366617; x=1729971417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8wry6chqZgKtIaIYCfOGXTh6+LfqDb7jBZtpUnJzzA=;
        b=VSnakYVbua4W5RIIB27OY8mPeK+J+YP6ayyVHxRxcmlcYuWbH+Jur9u+CACR3NVmyD
         mXt2ViOAjPfUwH/yMaEq5nGnOpIihYC0JDaTJ3ic3tZK1TOKHafSAvPr+ZmaBxzyGEDc
         W6QZfK3azJsSQqyKpWRQzxjjAwa/Q2yLq5VsGynFgGe+Y6Li5xJWUf3pvCQ0b2BPGcJh
         5lGVCwkvRyG87Njx7czRI6TZGgsEHUFjfBlviHo6qdS3dmZK7NqS69/MGrFaTAnUTu9G
         dI4rBeyJ+le1+KC+VYxJlOttKPHrMjR0/fzqCtd4kjJvISvS0Kf6g4EfZD0md1jiifi+
         FtVw==
X-Forwarded-Encrypted: i=1; AJvYcCUKIMw9dkenCswh6htOLpogYNgVKoGW3CtkXya/ZpYNrZYRT3REnB/7YniukmHJ3BSFbJFdPLS1jI9NAM4=@vger.kernel.org, AJvYcCVPH2sfEnDDY6mjhE6xJ8W3TGwjXmWKs3LITVMCPLxl5AoKrx+i8ruM53VL5okyzO9IQ94/i9ZX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz41V6rEPlyTKeO2+lPcpFhGG/Hnsjk9bJIUWqacMb9+9E7Nuc
	/xuwebc+CRFDGfjQTr7hfTCgwXxpqH6BCUeG2ZWN9DU9vQLCEHNA
X-Google-Smtp-Source: AGHT+IGXgOk4KTkkEjGgBMA0IObcFvbWBo6IADw3ipWi9e8akMafAg/9yVxNMGtIeUVtNiXyk5GZtQ==
X-Received: by 2002:a05:600c:1c82:b0:428:1b0d:8657 with SMTP id 5b1f17b1804b1-431616a3a22mr44428925e9.22.1729366617178;
        Sat, 19 Oct 2024 12:36:57 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-f8f1-d6d3-1513-aa34.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:f8f1:d6d3:1513:aa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57e66asm2671335e9.13.2024.10.19.12.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 12:36:54 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 19 Oct 2024 21:36:43 +0200
Subject: [PATCH 1/2] leds: max5970: fix unreleased fwnode_handle in probe
 function
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-max5970-of_node_put-v1-1-e6ce4af4119b@gmail.com>
References: <20241019-max5970-of_node_put-v1-0-e6ce4af4119b@gmail.com>
In-Reply-To: <20241019-max5970-of_node_put-v1-0-e6ce4af4119b@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <Naresh.Solanki@9elements.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729366612; l=1312;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=d2oOgds9qTucMQfgdKlCsqg43R4tHX95tUjnF2Qs+jM=;
 b=d51FDXvNLAX5fHrZzRxNAY5rcvu1OjIyl2kIB2d4PCpV4155/n1/M9qgoGyyOPwITcCTP1/Tk
 EZDbeLFLzrDAPAgmVktgtlo95ENjUAK1jBd6rqdNJWzDaoMM9PO8ppx
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

An object initialized via device_get_named_child_node() requires calls
to fwnode_handle_put() when it is no longer required to avoid leaking
memory.

Add the missing calls to fwnode_handle_put() in the different paths
(error paths and normal exit).

Cc: stable@vger.kernel.org
Fixes: 736214b4b02a ("leds: max5970: Add support for max5970")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-max5970.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/leds-max5970.c b/drivers/leds/leds-max5970.c
index 56a584311581..c021330e0ae7 100644
--- a/drivers/leds/leds-max5970.c
+++ b/drivers/leds/leds-max5970.c
@@ -72,6 +72,7 @@ static int max5970_led_probe(struct platform_device *pdev)
 
 		ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 		if (!ddata) {
+			fwnode_handle_put(led_node);
 			fwnode_handle_put(child);
 			return -ENOMEM;
 		}
@@ -89,11 +90,14 @@ static int max5970_led_probe(struct platform_device *pdev)
 
 		ret = devm_led_classdev_register(dev, &ddata->cdev);
 		if (ret < 0) {
+			fwnode_handle_put(led_node);
 			fwnode_handle_put(child);
 			return dev_err_probe(dev, ret, "Failed to initialize LED %u\n", reg);
 		}
 	}
 
+	fwnode_handle_put(led_node);
+
 	return ret;
 }
 

-- 
2.43.0


