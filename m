Return-Path: <linux-leds+bounces-1804-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C578D71B9
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 21:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A97DD1F217AF
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 19:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7DD154BF3;
	Sat,  1 Jun 2024 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XOFkn+af"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA71514E2EF
	for <linux-leds@vger.kernel.org>; Sat,  1 Jun 2024 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717271742; cv=none; b=dEnI6ywbTva2NZgYWoqXtb2I8WJq6jhYbvPtpNA4U0lCiqjQ6omGyoR2Q1HYxp/r9P81nj57I6KuoehUMEqBQUVnG7jn4itrWyFX5GLt2bXHQ71S3THqkvgjlYX/ZJ62Fy0nW7WAEDZr45G0i3PGqZWCWokN1QouVI7CWD6Gp0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717271742; c=relaxed/simple;
	bh=iRxTTqZQ/Ww/iSI/KRWovicP98HoKUzH9baahuF9xNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aOUpk4FL0FwaAPPy+nH5rJFbZ34rPEewd2C1CZo2INeWuwb5bwhnrs2WrP9jWNpQlWFQN1XrxjYiskHpJIppiimiodaqFQl+lI+IZLI3IfUlAJqG5lcupMsW5RpGgBUn2kytOJ3McShP4PwP1w5wWnZY2i2sWxgerboABxM7Ezg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XOFkn+af; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717271739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q+rUfVMlzWwY+cqiUNbek2HWCLE4SZUy9WlZitvOklA=;
	b=XOFkn+afyFsWVdsiM6tmThhHHNCThPQNr7KBD5C1KOH+FfVM/4OMSuvaE/FPl0Hey2VXaI
	ER1zWEz9OCXo0Q8OWyemYW4GlCEFpqZnUq9KSHBvK0zKIdJ1Z2N8vJhgiI7l9Eg1ItJQWs
	poYHVUm37TiSQNuZNoFOY9m1HIzLKgo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-mSXPUnMnPkauFMtXSQFtjA-1; Sat, 01 Jun 2024 15:55:37 -0400
X-MC-Unique: mSXPUnMnPkauFMtXSQFtjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68A398008A4;
	Sat,  1 Jun 2024 19:55:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDF9B1C00A97;
	Sat,  1 Jun 2024 19:55:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [RFC 0/2] leds: trigger: input-events: Fix locking issues of input_lock vs led-trigger locks
Date: Sat,  1 Jun 2024 21:55:26 +0200
Message-ID: <20240601195528.48308-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Hi Lee, et. al.,

So approx. 24 hours after you merged my input-events trigger I have found
a rather nasty locking issue with it after plugging a USB keyboard into
a tablet which uses this new trigger. Sorry about the bad timing.

Patch 2/2 of this series tries to fix this and it fixes my reproducer.
But I was worried about the deactivate path, so I gave that a try with
the patch in place and this resulted in a new lockdep warning
(now on deactivate).

So I need a different approach. I have a plan how to fix this differently
and I plan to write a patch on top of for-leds-next in the next couple of
days. But I guess you could also drop the "leds: trigger: Add new LED Input
events trigger" from for-leds-next for now.

I thought it would be still good to post this patch as it shows the complex
problem of LEDs or LED triggers getting registered by subsystems while
holding a global lock from that subsystem vs the activate / deactivate
method of the trigger calling functions of that same subsystem which
require that same global lock.  Basically this is the same LED trigger
problem as this 6.9+ regression:

https://lore.kernel.org/regressions/42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info/

Regards,

Hans


Hans de Goede (2):
  leds: trigger: input-events: Replace led_on with a flags field
  leds: trigger: input-events: Fix locking issues of input_lock vs
    led-trigger locks

 drivers/leds/trigger/ledtrig-input-events.c | 53 ++++++++++++++-------
 1 file changed, 35 insertions(+), 18 deletions(-)

-- 
2.45.1


