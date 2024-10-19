Return-Path: <linux-leds+bounces-3130-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8036C9A507D
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2024 21:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06D681F22CCE
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2024 19:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C90D191496;
	Sat, 19 Oct 2024 19:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfXrjdqK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6D219149F;
	Sat, 19 Oct 2024 19:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729366618; cv=none; b=REuYWKOL4WGnyzSubKppbtmmi96bi1RzROJuqvDHxbCJCz8NBO/2yWn3JixH0CqE667bTkJF7LteqOEHF4M4qjP1IrQvLJ8uNC2d9IG829lMsSokL4Gyc3X/gZ1UGlu3mS0+VTZcAgCAMjF6qLQFs1pzlspAfaK3WPx2dvAWGjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729366618; c=relaxed/simple;
	bh=sRhWhBOKZi1ss4zw4+0+/y1VvPKZuQbq0qeeG1W5FdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WR2PQ20hrzF5iIj+EiFuWyfIN+bgP/Js6KlZWPanQGdkiUuXPhkmKSz6YrjvLPbxFV0k/WfRdQ77CjaYWdXJ1JrUfW/p1AMEeeKWIgn36wCQGK7Tt8aOaqQbzs0saMA11dFvP8Ye1PQyyjSx6LP5Q+J7bMwBC6CNnzNecskRKMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfXrjdqK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431695fa98bso6632025e9.3;
        Sat, 19 Oct 2024 12:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729366614; x=1729971414; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v0OYkXB8VktlSdTAQ14RoH3fm6PKpbJT3bfx/sl5TJ4=;
        b=VfXrjdqK4JTc3B+07gAR94OIguNdO0nekxVZALECinuAAW2bYOqsZjepvMu/+hVErp
         p6lZSV3+R7elFnbQEsGN5TSJOCgOx4+82lUhSMJRDBP4LNADoczY4FEmLuO37PQAx6dr
         fP5k51C0oY56Y//nMsLN7af3ARKkTqvURduv8H10afVhQBDV840nRx5n1OGrwKr9plMU
         6h6quA03xl+NFTuc+O7M24+0MthUfeDPjmj8CQnJ5LZqaPsbCe9UaZQMjMBgl43eE+0H
         AjZJ28fPhKdcIjAEizOLqmy28buvGf3vlIDM/+ZPg0pBU+OIVvvL6EWjWhUCbV2WBCJm
         lfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729366614; x=1729971414;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0OYkXB8VktlSdTAQ14RoH3fm6PKpbJT3bfx/sl5TJ4=;
        b=HThBEPcjnN8Jn8sdAC7SVknMiI9VS6vv4ogpXkkS7no4azR7C3FKmNw3X6qwTL5AOH
         LB/tPXNJiHLT5ICcVeNRNfdzwpSRJd5hbwohzAj/G9cGj6/8Saqv16xE5bLuxZjZA/jl
         uLLONOzVC3iiBUzf5IYuI7wneOcJMBJeAnqEiFq0BY2qyYEvUQVYflMsXZcHvRuFEcDf
         db/bcHc/Ypbp4wb54wv3vk2vG9ZnBssnKOrDyPnRYg90/IkfdD5yDRXVWANeXHVoFg9U
         3yOaeojTn0d3ZLFqLUe8FLXLT7d0096yYI2UiBbBKCsA3ajEY77fnh9rw7LQvg4g12Z/
         j/6A==
X-Forwarded-Encrypted: i=1; AJvYcCVn1KaVfTysOs+Edfo55xgZZ6hlQqkBtTIBgrTNcRjXWnvRZPo+eheg6MeES+sgUWLIZ8LlrwqC@vger.kernel.org, AJvYcCWEPWX3OSuyaojOUBapiDrVUp+q06Bl9KjsbdXdzebFEq8Jxm0JqPxQLZv8PDfEGLPzCLKGZVVKIpAQd7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpOxbCcjouYMDDzD1YwQu0zPOz7cfYpy6dMtZfHn0NOwanCR+P
	/WBzJyC/bHLserzO1QwPC/AazVI5357dy/zmbnBotYKiya/2/WZdoiDAGg==
X-Google-Smtp-Source: AGHT+IE0/S8eytgT1eHaj9W0XwDlbdYQcRqhAh40I/BHjWepzAUmpIEq8SRagpi6Ey+XdCGMXR6Tnw==
X-Received: by 2002:a05:600c:4ed2:b0:426:8884:2c58 with SMTP id 5b1f17b1804b1-43161622989mr40845435e9.4.1729366614238;
        Sat, 19 Oct 2024 12:36:54 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-f8f1-d6d3-1513-aa34.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:f8f1:d6d3:1513:aa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57e66asm2671335e9.13.2024.10.19.12.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 12:36:53 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] leds: max5970: fix unreleased fwnode_handle in probe
 function
Date: Sat, 19 Oct 2024 21:36:42 +0200
Message-Id: <20241019-max5970-of_node_put-v1-0-e6ce4af4119b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEoKFGcC/x3MQQqAIBBA0avErBNGK8KuEhGVY80iDa0QorsnL
 d/i/wciBaYIXfFAoJsje5chywKWbXIrCTbZoFDVEqUW+5Qa3aLwdnTe0Hhcp9CVnhFr27RGQS6
 PQJbTf+2H9/0AniVNtWUAAAA=
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <Naresh.Solanki@9elements.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729366612; l=1107;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=sRhWhBOKZi1ss4zw4+0+/y1VvPKZuQbq0qeeG1W5FdQ=;
 b=4wgMAXy1dfChy3MPsn7rKpKgmnkxltf/D0dSE32bJ/8Lmi+uI5TLt3+UMPZisl7m+WN6kKPft
 tOZwczxCT36DQCNKEIoEJM6cHD+D3sOZLW+9rlRV2EAMgpkouea22Y5
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series fixes the wrong management of the 'led_node' fwnode_handle,
which is not released after it is no longer required. This affects both
the normal path of execution and the existing error paths (currently
two) in max5970_led_probe().

First, the missing callst to fwnode_handle_put() in the different code
paths are added, to make the patch available for stable kernels. Then,
the code gets updated to a more robust approach by means of the __free()
macro to automatically release the node when it goes out of scope,
removing the need for explicit calls to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      leds: max5970: fix unreleased fwnode_handle in probe function
      leds: max5970: use cleanup facility for fwnode_handle led_node

 drivers/leds/leds-max5970.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241019-max5970-of_node_put-939b004f57d2

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


