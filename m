Return-Path: <linux-leds+bounces-6011-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25545C3555A
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 12:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BF0A42486B
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 11:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FA72C17A1;
	Wed,  5 Nov 2025 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gxcZwYrT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69212E5B2A
	for <linux-leds@vger.kernel.org>; Wed,  5 Nov 2025 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341575; cv=none; b=FHqnBOA2AC62yEyk7ZNdTNHhnNtKdeVBCWqAGtY00M6b7vW9f9OmOswJKZqkMJ3GtFCfXEgK/coicjBdE8ofs+c77zuekuCMKq7qBlJK/OQGMPKX01mLKow+DY0hc5FOKdxrutUO1LmVGiKOrENV55begIsEtsKrJgp38j5gJpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341575; c=relaxed/simple;
	bh=aabsKPFWol3OJ7wY7wf6TtpPtGBpyhyhY9TUbSJJLII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BAYtVZWjVIaOyPwf5fHu+OQzW+l5l3/zfq664/pHcr7tAkZ2YWl/Skpm6zZErqVsCAde4KO6l4ttRyxkWxXdFu0lfFH1o89JrHiIpO1CkStyQU2ZoLZRbqWo3orDwRRpTGSrZWFVgXLkZGk04wR/XQk5fAfImm7XoLXu3a3uxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gxcZwYrT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477563bcbbcso8816065e9.0
        for <linux-leds@vger.kernel.org>; Wed, 05 Nov 2025 03:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762341572; x=1762946372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9ZoeKzZOBJ8O1X8YsczWn8JrsyIoqb3TF8bG5VlZ6s=;
        b=gxcZwYrThlYwvVzeZKCV6YCiFl68AYnDBcZ/ON+/fTmenZ7dGwzLy099V96we8AUq8
         0fMYfLrEOb0AIZRXI1IBSYoQo42fhB8uDl13F7N6C782Hi/KR5TQowGLwohaqiBBvr6y
         ybH02b8cSHt5hCuYf90GTUVaYlrfGlY1QQ7jOihb3LmjcqgRNdlBVVRXJGJt7Qxfcnx3
         4bw02aRP+HEfI9csdmjJ3aBzZRQV7Hk7y2rAbtAkOexbhXEV3t5xv0ni/ZrLwbdltd99
         eY9X/WerPHbL7XPr4I8RpC0P+gX3fnRbKmb0hncDEijsv3bgd9UUVK/LIQsZDRfTtC5p
         GL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341572; x=1762946372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9ZoeKzZOBJ8O1X8YsczWn8JrsyIoqb3TF8bG5VlZ6s=;
        b=DHvK+yuhsASZ71paJcsUque8RjVPcQkUTX/KIMoGCfetY2fG9uZufaUVtF3oBKxgdH
         6vn6M78iRks7quyWztr6bmR/0Luzz4TclPzNgVxXU7MbyP9HoKarnztHAz+K7EH/+IdF
         OiP0aQJg847Mgdscswf4mkuM4MiPFfg5eRVV4/wKk9zPkgU26r8jgOFw3hW6KGLAQFFO
         JqsWtXRh0N7rCtgrG/f/eCy9Ki+4PTJUn2LirLCBwgp6bELJE/2K0vImt3RrrjvM2ZHq
         hmbhdKBJDEP1WzKLYRMVwXjboQ2NAzaJ5TVuwtPUmsXkludQdfy/BVKpRR03jbArsGRR
         SgYg==
X-Forwarded-Encrypted: i=1; AJvYcCUpaes05jwxfWKeNwgSROLaw20p79fv1pUWk4Z/RHlS/hjTH5p9wCQZCJ4jZw5aCY1xhoOexIFaGXfD@vger.kernel.org
X-Gm-Message-State: AOJu0YxRvkvCYLPXcawLYoZjgP8s3zM1L9wS4EvjIO3UouS4gqhYXP6u
	TkiP1FAmPBvz2zdYxKj02DzHAKBPC3ueRul5tanFg+jaeIEHFxX+XkFYPn/oCLXMZJc=
X-Gm-Gg: ASbGncuX1F7wIoXf70Z7YyQInSr+oMZq63UVG29sj3k9p3vmO8oK5otGwP8YsBCxFiJ
	HqFiPZ+Ie0JIjcizxr/5d8a33v68mjkOoTdozsWRWZCCGBUN1UTueIwx4p1MptfUDHryL+GW26R
	jaUuRd9TiJPcOkwTvmzHeD9bf2n989Q12YYDFO15nYKVA8ZRStjcrPwf4EySVton1tohH17o6fn
	J8pB553z3GfAbSeefm3KZ4kwXy/Oi9OWAcVqsOG4idMqVjweEe0vcATzlmtfbGbFKzdgQj97Fps
	fkbr/KF5CWXDkCdjYOMpYKR8g0ZxkV14eKQaoMh+jjcZO8H4NSYax4lcMNgRNNfyNizO0Cy8ffl
	NCJfusNtOiRFvGyBhiKZqathBjFa4CZ9kaXQAMhYUr1bPOq9G72iD8JqDIKE8xyBKy+/vZr5C8P
	YKghiI04nyhW1QcoPE/wBbQspgu4+G7Mb4fJk=
X-Google-Smtp-Source: AGHT+IFvzesjCO25PoLrWQtVvB99hETRDXusyKHlx8TTYHHN77FB5rlYFu4DB6U/Ofm98Y0XnPco6g==
X-Received: by 2002:a05:600c:5304:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-4775ce15c6cmr26611165e9.30.1762341571929;
        Wed, 05 Nov 2025 03:19:31 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47755930592sm39499405e9.12.2025.11.05.03.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:19:31 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Pavel Machek <pavel@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH] leds: trigger: replace use of system_wq with system_percpu_wq
Date: Wed,  5 Nov 2025 12:19:24 +0100
Message-ID: <20251105111924.141555-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/leds/trigger/ledtrig-input-events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
index 1c79731562c2..3c6414259c27 100644
--- a/drivers/leds/trigger/ledtrig-input-events.c
+++ b/drivers/leds/trigger/ledtrig-input-events.c
@@ -66,7 +66,7 @@ static void input_events_event(struct input_handle *handle, unsigned int type,
 
 	spin_unlock_irqrestore(&data->lock, flags);
 
-	mod_delayed_work(system_wq, &data->work, led_off_delay);
+	mod_delayed_work(system_percpu_wq, &data->work, led_off_delay);
 }
 
 static int input_events_connect(struct input_handler *handler, struct input_dev *dev,
-- 
2.51.1


