Return-Path: <linux-leds+bounces-4363-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B66A6EC60
	for <lists+linux-leds@lfdr.de>; Tue, 25 Mar 2025 10:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B97B3B3B0F
	for <lists+linux-leds@lfdr.de>; Tue, 25 Mar 2025 09:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF8B253F11;
	Tue, 25 Mar 2025 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0x1/fXT"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1D01B4F0E
	for <linux-leds@vger.kernel.org>; Tue, 25 Mar 2025 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742894532; cv=none; b=O5yvgonRWDZwcYsHGLsnzBXQgSilpmmi5A83C6E1Kpk37VP6XGBeBvL+RYOkY2zuVObis4dHJqBdVp2Rn/oAXxuur8Unre2UerMfIQjCkVGj5D9L4vXAQsw7nQHmW+QGxd50VLHdryhSYunRIhYXfxDeNkbyRgVmyniGOrKEqqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742894532; c=relaxed/simple;
	bh=xaWwfXPFRfECFLckVObq454sJfCkJQ61bDemiqaexqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZsRWkb7MleE6k001Af+8k6RM76CUy/MAr39LT7+KWo+3cXUnsxVcmbtyoa9d/tZaqCq3IXRiJcqI7y9F3zvQ+IAjim9ceOipMIVmRoIAw0O07743Hx2AgH09jqmHLUz9MDwO1hYslp0QWaLn1Id8/NTbd6j1asEDefK/vJe7OuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F0x1/fXT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742894529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P9IKeqJUU7xfsmBL2lNiXrAlhz1JyfP8xtACFJ20okg=;
	b=F0x1/fXTrU0F5/qUDcF6VKCm9gNrX1KNs9zbkHc9E25d3+maoxoFQTS3KYQ08i/8M/r2q2
	h7D70JG8ga7yshRSdQx4kJn7DKIrvaq+Lw7lANjqwA19sfQT6l8o/sIdWUTLDp03+GEMob
	Ooys3XivmLX0aB4R+CuKQfiFBNwkLfs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-OflKCNz1McCGWfDK7B6yhQ-1; Tue, 25 Mar 2025 05:22:08 -0400
X-MC-Unique: OflKCNz1McCGWfDK7B6yhQ-1
X-Mimecast-MFC-AGG-ID: OflKCNz1McCGWfDK7B6yhQ_1742894527
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so34032425e9.2
        for <linux-leds@vger.kernel.org>; Tue, 25 Mar 2025 02:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742894526; x=1743499326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9IKeqJUU7xfsmBL2lNiXrAlhz1JyfP8xtACFJ20okg=;
        b=TsFYTNllW2UYqbz0vU+/zHYzlnZRV1EkBNU7Cw2JevChNijqOtZfJp+OP97ZDgFIT4
         pXw+QBqlWZvtYBCwK6fefHQI4wabMBDsXlwdRNBXq33NY1XJY/GyCcCw4As62/SSpey5
         JjxNqAPTYD3/CEnFlRc/SaK9KB2p3dYIpNLh+ojwbHjqTo3H6O4FPn3x7IiYjmzE1g7O
         sk7w6B3/CXZkeFEv0CZoIzmes0YNsDJY+QId8Qul2n9kDjTw/0nvaroks+u2Z1QyknKn
         n5rXPO5LuYGFcc27ry+Dy9yqgVsFwU6L+ZKDd/uFFk60Z3O9RHnm4cIOhFCCi+jVvxLr
         2+sA==
X-Forwarded-Encrypted: i=1; AJvYcCX13YHCw97jmOZwsCN2aNTOegNH/7UUQ6lvDm5ZqbeFqz2y4j/AGatG6gSwobXwg8fExgZIz7rBzw7a@vger.kernel.org
X-Gm-Message-State: AOJu0YzBQ6t37HAJSecJtODiNlvOFHduKfUAI62V/m0n7/lsZqqh/KXb
	48QO8I5gWrDj9FrzXsrA2PBbeNCEa5URbxmxfdTCSiA7A+Ev89NFRlv4pSeRhILkOspUAcUb01n
	9E8fzgLpcILCglpV6aoOvcwlETXHPu1IIXzXut9j7G3nn1JKSOa2HSP9NNFs=
X-Gm-Gg: ASbGncvyxHqPfwWoBODc3k08JGVLfYBrXNtfbPIn8FuxhGC8wuxNsWUwmTSZm+AvfmF
	KS66AGXo3fWL2j2vbYAf/+0hJyIt7UvWh+yU441Jp98HkN+i2L2g6gAZkiu0/xhWwYka5nWaeaZ
	kqCC/S6QkBBdLUf7opuBjDNZ4h2COXeHa2GQrXaGTaLBlF7QMG0kIgZxleWgodemgjXpjOAexBc
	z8Qmvh1Jt0Jkq6xAhQuRBQn5vCcFfiEr9SlCmx0XTwQsh/zViC66lIjUfPaDQvu92yvjeji2xtm
	Imd9zaTx1zmhpyXrP+3cQN/PPHNDA7ZMlhCoMh2QNzPeGfs/IToylFtc+0gXRQ==
X-Received: by 2002:a05:600c:1d92:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-43d509e3facmr158369985e9.4.1742894525946;
        Tue, 25 Mar 2025 02:22:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgB3O6gG9DIBwRaHL0X31Mvb/WLhRUK8r9nnr/FWmU8azB5KhfTf5kSGnz61tuuks4tGk/sQ==
X-Received: by 2002:a05:600c:1d92:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-43d509e3facmr158369595e9.4.1742894525528;
        Tue, 25 Mar 2025 02:22:05 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9ec29sm144070755e9.30.2025.03.25.02.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:22:04 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Bao Cheng Su <baocheng.su@siemens.com>,
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust the file entry in SIEMENS IPC LED DRIVERS
Date: Tue, 25 Mar 2025 10:21:59 +0100
Message-ID: <20250325092159.213463-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 835a0c10d33b ("leds: Rename simple directory to simatic") renames
the driver's directory to drivers/leds/simatic, but misses to adjust the
SIEMENS IPC LED DRIVERS section in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference. Adjust the file entry to this renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e6454e171c4b..7a4408512381 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22040,7 +22040,7 @@ M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
 M:	Tobias Schaffner <tobias.schaffner@siemens.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
-F:	drivers/leds/simple/
+F:	drivers/leds/simatic/
 
 SIEMENS IPC PLATFORM DRIVERS
 M:	Bao Cheng Su <baocheng.su@siemens.com>
-- 
2.48.1


