Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDAE832FE68
	for <lists+linux-leds@lfdr.de>; Sun,  7 Mar 2021 03:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhCGCEC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Mar 2021 21:04:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhCGCDq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Mar 2021 21:03:46 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6E5C06174A;
        Sat,  6 Mar 2021 18:03:46 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id t13so3620291qta.11;
        Sat, 06 Mar 2021 18:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QxvB5zhcmMCmsEmz42AGBb9LKLykoB0qkc+n27okF9U=;
        b=j8G7N+tYVahLmY1MwTWX5p3UxVFf34QuZnb4RQzdrtNrbmS87lbelnaXcCrFCRACzR
         h67H50sVB32nEE4wjNsUQdJI7qXCb7w3FzD2hquz5G27z8vz/yxTXzhgJNULhELecPBk
         iVMmJrPMkpM9eUtsXb5l8LpF2KDziudQ22GqHl5v+MQtuoBBxXfahPtaWiTFWW5CFeNx
         8lHrvoLd/Gak0an8gp8tXRtViD/u5rX1bs5wDaY3xbhQUmlrasHeEol2X6yxCb4VY++c
         oSDl4ZfFHzUXHGtjtpOzro583eyFi3/ECutAzwPH/JEBYda6tBkzmRL98loH2yntuYXb
         Fc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QxvB5zhcmMCmsEmz42AGBb9LKLykoB0qkc+n27okF9U=;
        b=NBU4BV4Y52315ueDenU04hOlDZ7yPAD006w3crs8T/gd6zVjvHtbDiBPyCocj4QaIc
         QbcQnsB+sh2KTEG+dSKU5ujAXrmm7scDt5tgKy6cw8XCpDdMZt/lfEwejIt7wFCsQcgm
         gbiwDXAWXUeoh+qHD+esw8Nwtue2xe5DGld/v0zTC2/NlJP1kD2ZmuIuHBxXO2Le0oXY
         kqIxP8Tnb+dD9exYD1ayDTCquHHrZfZfZFKBrUVc5+un5Q8VlUcucg2JEEDQS2cAFnH8
         QSY+zhlIHCNeblOBhhOjzY8WP24VuwIBDNRocrfr0CWkodxzjFHrh8O/wXbfbGyhqlVB
         +LJQ==
X-Gm-Message-State: AOAM530B9uFkqKo6SKkzbu0JqIF8NBaNI5cBDhBY66MFcUoBXpXJN5aZ
        jwpNCawaHSPZJEQ3D46RoQ8FId9MofM=
X-Google-Smtp-Source: ABdhPJyBJJW8ta6uqN30Jzhj1K2htHRikMUpYi3bflx8dLecDiYkRA6MbmPOKplJ2LSNPSEyioU97g==
X-Received: by 2002:ac8:735a:: with SMTP id q26mr15092970qtp.5.1615082625033;
        Sat, 06 Mar 2021 18:03:45 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id j1sm5058669qti.55.2021.03.06.18.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 18:03:44 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailauth.nyi.internal (Postfix) with ESMTP id C40C127C0054;
        Sat,  6 Mar 2021 21:03:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 06 Mar 2021 21:03:43 -0500
X-ME-Sender: <xms:fTREYN4WcYAXuv1L7V1ho_t4lxFY2EWynqW5xLW3eR_NGaiy_hKJ1w>
    <xme:fTREYK5MUCt43gzOXE-Oa_womMBScxCN0O8Z4Boq_8lVLlAqJr3H2zPkOPq0ieK3L
    Rl71ynyCC_FZIKg1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtledggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpedtfefgfeeuleevvedtheejgeetueejkeeujeethfeiteekffehvdevveff
    jefgteenucfkphepudefuddruddtjedrudegjedruddvieenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:fTREYEdS3SHh1RmwWFN02nYrk42Hx1YDq7whkGLaZNM0aSTAzQE7rg>
    <xmx:fTREYGI-f_ONBmyRJTgTqblQMjJRYfQfgisVA24GiNilRO-HLIU0WA>
    <xmx:fTREYBJg1bm6BN6TNSfn4SCp0ZFxWGZyw1dE3ATwJF-yUougxhBllQ>
    <xmx:fzREYJ_v6cZJBRCabx8tHeMQGezwGdhqGUX5zmtb6JwH2Pfc1fJWcw>
Received: from localhost (unknown [131.107.147.126])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7F2B21080064;
        Sat,  6 Mar 2021 21:03:41 -0500 (EST)
Date:   Sun, 7 Mar 2021 10:02:32 +0800
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Marc Kleine-Budde <mkl@pengutronix.de>
Cc:     Andrea Righi <andrea.righi@canonical.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, schuchmann@schleissheimer.de
Subject: Re: [PATCH] leds: trigger: fix potential deadlock with libata
Message-ID: <YEQ0ONQCwVUd0wmc@boqun-archlinux>
References: <20201102104152.GG9930@xps-13-7390>
 <20210306203954.ya5oqgkdalcw45c4@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210306203954.ya5oqgkdalcw45c4@pengutronix.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Mar 06, 2021 at 09:39:54PM +0100, Marc Kleine-Budde wrote:
> Hello *,
> 
> On 02.11.2020 11:41:52, Andrea Righi wrote:
> > We have the following potential deadlock condition:
> > 
> >  ========================================================
> >  WARNING: possible irq lock inversion dependency detected
> >  5.10.0-rc2+ #25 Not tainted
> >  --------------------------------------------------------
> >  swapper/3/0 just changed the state of lock:
> >  ffff8880063bd618 (&host->lock){-...}-{2:2}, at: ata_bmdma_interrupt+0x27/0x200
> >  but this lock took another, HARDIRQ-READ-unsafe lock in the past:
> >   (&trig->leddev_list_lock){.+.?}-{2:2}
> > 
> >  and interrupts could create inverse lock ordering between them.
> 
> [...]
> 
> > ---
> >  drivers/leds/led-triggers.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > index 91da90cfb11d..16d1a93a10a8 100644
> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
> > @@ -378,14 +378,15 @@ void led_trigger_event(struct led_trigger *trig,
> >  			enum led_brightness brightness)
> >  {
> >  	struct led_classdev *led_cdev;
> > +	unsigned long flags;
> >  
> >  	if (!trig)
> >  		return;
> >  
> > -	read_lock(&trig->leddev_list_lock);
> > +	read_lock_irqsave(&trig->leddev_list_lock, flags);
> >  	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
> >  		led_set_brightness(led_cdev, brightness);
> > -	read_unlock(&trig->leddev_list_lock);
> > +	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
> >  }
> >  EXPORT_SYMBOL_GPL(led_trigger_event);
> 
> meanwhile this patch hit v5.10.x stable and caused a performance
> degradation on our use case:
> 
> It's an embedded ARM system, 4x Cortex A53, with an SPI attached CAN
> controller. CAN stands for Controller Area Network and here used to
> connect to some automotive equipment. Over CAN an ISOTP (a CAN-specific
> Transport Protocol) transfer is running. With this patch, we see CAN
> frames delayed for ~6ms, the usual gap between CAN frames is 240µs.
> 
> Reverting this patch, restores the old performance.
> 
> What is the best way to solve this dilemma? Identify the critical path
> in our use case? Is there a way we can get around the irqsave in
> led_trigger_event()?
> 

Probably, we can change from rwlock to rcu here, POC code as follow,
only compile tested. Marc, could you see whether this help the
performance on your platform? Please note that I haven't test it in a
running kernel and I'm not that familir with led subsystem, so use it
with caution ;-)

(While at it, I think maybe we miss the leddev_list_lock in net/mac80211
in the patch)

Regards,
Boqun
------->8
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 4e7b78a84149..ae68ccab6cc9 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -171,10 +171,12 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 
 	/* Remove any existing trigger */
 	if (led_cdev->trigger) {
-		write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
-		list_del(&led_cdev->trig_list);
-		write_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock,
+		spin_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
+		list_del_rcu(&led_cdev->trig_list);
+		spin_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock,
 			flags);
+		/* Wait for the readers gone */
+		synchronize_rcu();
 		cancel_work_sync(&led_cdev->set_brightness_work);
 		led_stop_software_blink(led_cdev);
 		if (led_cdev->trigger->deactivate)
@@ -186,9 +188,9 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		led_set_brightness(led_cdev, LED_OFF);
 	}
 	if (trig) {
-		write_lock_irqsave(&trig->leddev_list_lock, flags);
-		list_add_tail(&led_cdev->trig_list, &trig->led_cdevs);
-		write_unlock_irqrestore(&trig->leddev_list_lock, flags);
+		spin_lock_irqsave(&trig->leddev_list_lock, flags);
+		list_add_tail_rcu(&led_cdev->trig_list, &trig->led_cdevs);
+		spin_unlock_irqrestore(&trig->leddev_list_lock, flags);
 		led_cdev->trigger = trig;
 
 		if (trig->activate)
@@ -223,9 +225,12 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		trig->deactivate(led_cdev);
 err_activate:
 
-	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
-	list_del(&led_cdev->trig_list);
-	write_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock, flags);
+	spin_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
+	list_del_rcu(&led_cdev->trig_list);
+	spin_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock, flags);
+
+	/* XXX could use call_rcu() here? */
+	synchronize_rcu();
 	led_cdev->trigger = NULL;
 	led_cdev->trigger_data = NULL;
 	led_set_brightness(led_cdev, LED_OFF);
@@ -285,7 +290,7 @@ int led_trigger_register(struct led_trigger *trig)
 	struct led_classdev *led_cdev;
 	struct led_trigger *_trig;
 
-	rwlock_init(&trig->leddev_list_lock);
+	spin_lock_init(&trig->leddev_list_lock);
 	INIT_LIST_HEAD(&trig->led_cdevs);
 
 	down_write(&triggers_list_lock);
@@ -378,15 +383,14 @@ void led_trigger_event(struct led_trigger *trig,
 			enum led_brightness brightness)
 {
 	struct led_classdev *led_cdev;
-	unsigned long flags;
 
 	if (!trig)
 		return;
 
-	read_lock_irqsave(&trig->leddev_list_lock, flags);
-	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
+	rcu_read_lock();
+	list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list)
 		led_set_brightness(led_cdev, brightness);
-	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(led_trigger_event);
 
@@ -397,20 +401,19 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
 			     int invert)
 {
 	struct led_classdev *led_cdev;
-	unsigned long flags;
 
 	if (!trig)
 		return;
 
-	read_lock_irqsave(&trig->leddev_list_lock, flags);
-	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
+	rcu_read_lock();
+	list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
 		if (oneshot)
 			led_blink_set_oneshot(led_cdev, delay_on, delay_off,
 					      invert);
 		else
 			led_blink_set(led_cdev, delay_on, delay_off);
 	}
-	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
+	rcu_read_unlock();
 }
 
 void led_trigger_blink(struct led_trigger *trig,
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a8d6409c993..5acc0e8a9f18 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -356,7 +356,7 @@ struct led_trigger {
 	struct led_hw_trigger_type *trigger_type;
 
 	/* LEDs under control by this trigger (for simple triggers) */
-	rwlock_t	  leddev_list_lock;
+	spinlock_t	  leddev_list_lock;
 	struct list_head  led_cdevs;
 
 	/* Link to next registered trigger */
diff --git a/net/mac80211/led.c b/net/mac80211/led.c
index b275c8853074..5ec5070fe210 100644
--- a/net/mac80211/led.c
+++ b/net/mac80211/led.c
@@ -283,10 +283,10 @@ static void tpt_trig_timer(struct timer_list *t)
 		}
 	}
 
-	read_lock(&local->tpt_led.leddev_list_lock);
+	rcu_read_lock();
 	list_for_each_entry(led_cdev, &local->tpt_led.led_cdevs, trig_list)
 		led_blink_set(led_cdev, &on, &off);
-	read_unlock(&local->tpt_led.leddev_list_lock);
+	rcu_read_unlock();
 }
 
 const char *
@@ -349,10 +349,10 @@ static void ieee80211_stop_tpt_led_trig(struct ieee80211_local *local)
 	tpt_trig->running = false;
 	del_timer_sync(&tpt_trig->timer);
 
-	read_lock(&local->tpt_led.leddev_list_lock);
+	rcu_read_lock();
 	list_for_each_entry(led_cdev, &local->tpt_led.led_cdevs, trig_list)
 		led_set_brightness(led_cdev, LED_OFF);
-	read_unlock(&local->tpt_led.leddev_list_lock);
+	rcu_read_unlock();
 }
 
 void ieee80211_mod_tpt_led_trig(struct ieee80211_local *local,
