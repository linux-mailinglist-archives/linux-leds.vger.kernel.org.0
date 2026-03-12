Return-Path: <linux-leds+bounces-7309-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MSm8FFcasmnUIgAAu9opvQ
	(envelope-from <linux-leds+bounces-7309-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 02:43:51 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C371026BFB0
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 02:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA5723038FEB
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 01:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08B23750AE;
	Thu, 12 Mar 2026 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAVgNH+I"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C9F35B658
	for <linux-leds@vger.kernel.org>; Thu, 12 Mar 2026 01:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773279817; cv=none; b=MDQ+nSfz2/ACebV0k2wXC7yM3Y3BjlccNMVfYgyDLUkzTEZ7ZY9WX85f1yff1/vWjCGR+/tqpUYedLolhkQHmzhq9GuI1dkuUm2Gw2pdqyPWqkZwRK82R9Sd/8GXfLnnO1QO8QHon1wx1wCI6MMICtavEkLWyBgnkzir7LRqk4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773279817; c=relaxed/simple;
	bh=5oUNMFnlgTg/SXZys2j4XgpjMUlowYQfsXUq4SsNHDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqMFVJw4cK8w56zbBqV/VKdyFkbzj3YVkP3Cu4c1P7UrMtWl27WK68T/uGH0Yxf76ksSob4PvlB3SkpfzdvplzQcfozRRywiqFSza8lmNJzVqtCozvrdgUx6jy+ObAHQjLqb0Zwp2VxqxnzdxWa2seci+t7ia++uqg8xsAqrqRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAVgNH+I; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271195d2a7so1405858c88.0
        for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 18:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773279816; x=1773884616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiqAYIX98YKijQ8a2vecadAbb1L8d/Slw8ZXp/UrT6M=;
        b=HAVgNH+IcJFQjXpToDYqEKB+xou/N/RgD7D4FmjNISmFj2HnBdQ59Hm/cIkhcsXIlh
         5ErRQqTM7Xmaw0bfsjA/GzzN5KhOqrC2BYW2NIMBcIrna33CBR7uVAyzHrZ9Af5R+7gl
         n3tuuuAtgxriudEslvTA1bcI3z5iz8+jkpw/MfMSpoONkTpF1Z1D6s9U9y0FN48ykULL
         JOnVfSvCGxjzZV7+7tr/F6V+/flmJN1/VAtmlPdk3YVNl9NVEQsVmsjIBXcbzOCuPaME
         xDpkHYoscrd/eEY5/s+k4f/BQsp6Ya0eqiZHmwYL55aEXgwFZU0Syl2LlU12aMUlHm+f
         qQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773279816; x=1773884616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OiqAYIX98YKijQ8a2vecadAbb1L8d/Slw8ZXp/UrT6M=;
        b=uRL/7k/j90VKW5ZApB2V1XxPg9gVxaThW2v3hNd5pyCus0v9oK5CSwIemlfD6GKEtd
         MDWsJnsmGALBFoCf8Ja8tAs5tuyl1AMUEWIc6uYgVwYC9NHNO539g1vvHjV6r2yDQVfB
         bsI0hFuwmW+peOIoMWnL1916tQvzNT+6uHEDtHgT4/dWUyVOCyEXSHn5it/ht5VwEx5x
         Vb736ZfbKEuFBAqmLOGHLZQe2s6z5cC6lJXjSKB+RaLfWZ2czUvLZYatCY0D2RUkiVta
         10Txojd2jAenrAkeALfle8JgBKKo8M7d9TmDopmqqyaYrMxo6V5Kj8IldaIqkACQPJhd
         qcGw==
X-Gm-Message-State: AOJu0Yyc8dREJR1oMGqHc2xeLWEQsyvCP3jAavD5+jC5iDrMuRZJQv3j
	ZNTaCLNTaWKxNHwxNR/sZa47fpkfVYQnhiHsgGye9HZdWtNDXnQ9X6XiUx+Skw==
X-Gm-Gg: ATEYQzz02HG2h3yDjIQHIuqdVFidocV8bQUHpG4IPSzYVSJKDwccMYXVcnkXe6NnNov
	k5nbKRvIF8XHnDiZCWj87S3b+bXT7TueVak6cXN7FLjc/Ci6loopo11gUArc4nkvZHrdlGatb9Y
	pgtCyDiiawG5GFgEEKuFwDgoKLwwbI1vPu/KNuaF63thS4zzjZX5CyloD/DNA+X0P8ZGwpaaLD1
	94Bk2Io90idFjX8CzLypzr+/LzDQrWpSd7UJbIVMbGXCPTAyGzVJtZHjTDsKEDLfhtvpp/N3OvJ
	qHnBa7vbitt4VN9OWgDjf+DWj3eA3XZTqyCP28d2r34g76aGD+tKh5TT4QBfoN1/pSbHjwM5iwE
	krMcOSV8PGbQuMTkjTMck+9Mv1ukn8CnDpR9LXZ4zJ7XY9xw745fH66SEyc2aWQYa+LUVc+bi09
	pNNlp7OvLiFO7DoncXmgfP+lfi//fODN/YDDBHiFCr4CcH/8psDWtEeREj4pljXigQvdSGgldVE
	/sQkcbZxynKmSY=
X-Received: by 2002:a05:7022:6990:b0:11a:4016:44a5 with SMTP id a92af1059eb24-128e780e7d2mr2499768c88.24.1773279815678;
        Wed, 11 Mar 2026 18:43:35 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:53e0:5b17:5211:b0f4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7c0d698sm6619016c88.6.2026.03.11.18.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:43:34 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 11 Mar 2026 18:43:27 -0700
Subject: [PATCH 1/2] leds: core: implement fallback to software node name
 for LED names
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-led-swnode-name-v1-1-798a49e041c6@gmail.com>
References: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
In-Reply-To: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7309-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C371026BFB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If a software node defining an LED is missing explicit 'label', 'color',
or 'function' properties, led_compose_name() currently fails with
-EINVAL, because fallback to using node name in place of LED name/label
is only implemented for OF nodes.

Implement similar fallback for software nodes. Unlike OF nodes, which
use the short 'name' attribute of the device tree node to avoid
including the address block, use fwnode_get_name() directly since
swnodes do not include an address block and always have a valid name.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/leds/led-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 59473f286b31..8ce41b36c645 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -581,6 +581,9 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 	} else if (is_of_node(fwnode)) {
 		n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
 			     to_of_node(fwnode)->name);
+	} else if (is_software_node(fwnode)) {
+		n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
+			     fwnode_get_name(fwnode));
 	} else
 		return -EINVAL;
 

-- 
2.53.0.473.g4a7958ca14-goog


