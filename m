Return-Path: <linux-leds+bounces-1811-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF1E8D770C
	for <lists+linux-leds@lfdr.de>; Sun,  2 Jun 2024 18:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 415D71C2137D
	for <lists+linux-leds@lfdr.de>; Sun,  2 Jun 2024 16:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1232F3C2D;
	Sun,  2 Jun 2024 16:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FxjMYNw9"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE3433BB
	for <linux-leds@vger.kernel.org>; Sun,  2 Jun 2024 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717344129; cv=none; b=XEjprzMqSqgGcvuEgBCG2KT5C9BhadyKBjEwfllz2Em/iUOD71ONT2lJEXutDixWeL5retZu04m0eiasha26U0wvNJnV3vcAD6ZLw0RNZ2NQdu3fRP1DCPh/G9lSO1Wz0OcnLEK5XZ7nJ8ANjTWEV1V/lWMpDiIOgIEG2ezOq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717344129; c=relaxed/simple;
	bh=dm957JQ6xj+6lDNhwueOETHgaTVN610xXqYhH7ZuTcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NBuGOuWTsWy9Itg3a9cw0uViJEqxvCnAnHa3MATGEvF/LPT7Fa4xV51KmAA9aGq8BXbHZ90jQ1WMLmhQgwMplTNt2Xte1vpes9ceytkz9eeReYrL7mVoyn02vAbXJTXZcFo3OaQkhK6N18ScY1yxfhuyXBB737QpHn8Wk6vFf/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FxjMYNw9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717344126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H0m44Lhp1aPIcWo54JcTzQWUPASnyQPAaECqjPE6itk=;
	b=FxjMYNw9NUb4oFjDv7ElOqNStHJbmisIbnajJS91KerjxkqgKEdO2JaR3pBl1In14AiR93
	E7oMcuiGND0Y+fc3g/RzQw4Be8s5Vsq4pKPoENN/FFjdI8SRoyEhHp0rcw8mYpiKzs6kAm
	ZyoXtBrbBThvyn6DvWtlRwL04Gs3L38=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-486-9Dn1mTCtOb2x8x4JFzO1HA-1; Sun,
 02 Jun 2024 12:02:04 -0400
X-MC-Unique: 9Dn1mTCtOb2x8x4JFzO1HA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64AD629AA381;
	Sun,  2 Jun 2024 16:02:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA393C15BEA;
	Sun,  2 Jun 2024 16:02:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [PATCH 0/1] leds: trigger: input-events: Rewrite to fix a serious locking issue
Date: Sun,  2 Jun 2024 18:02:02 +0200
Message-ID: <20240602160203.27339-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Hi All,

As first discussed here:
https://lore.kernel.org/linux-leds/20240601195528.48308-1-hdegoede@redhat.com/

Shortly after ledtrig-input-events being merged into leds-for-next I found
a serious locking issue with it :|

The single patch in this series fixes this. As indicated in the subject
this is close to a full rewrite of ledtrig-input-events. The core
functionality is preserved and since ledtrig-input-events ATM only exists
on leds-for-next the other behavioral changes involved are not a problem.

Lee, I personally think it makes sense to keep the history and apply this
on top (1). But if you prefer you could also drop the current version and
then I'll send out a new patch directly adding the new version of
the input-events trigger.

Regards,

Hans

1) Especially in the light of the similar issues in the netdev trigger


Hans de Goede (1):
  leds: trigger: input-events: Rewrite to fix a serious locking issue

 drivers/leds/trigger/ledtrig-input-events.c | 136 +++++---------------
 1 file changed, 34 insertions(+), 102 deletions(-)

-- 
2.45.1


