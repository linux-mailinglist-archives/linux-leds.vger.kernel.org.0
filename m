Return-Path: <linux-leds+bounces-6289-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA5EC7E7C0
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 22:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 799E43A6062
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 21:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9A51FF1C7;
	Sun, 23 Nov 2025 21:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="GR7QYVS/"
X-Original-To: linux-leds@vger.kernel.org
Received: from sonic309-21.consmr.mail.ne1.yahoo.com (sonic309-21.consmr.mail.ne1.yahoo.com [66.163.184.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4453A1B4F2C
	for <linux-leds@vger.kernel.org>; Sun, 23 Nov 2025 21:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763933214; cv=none; b=erTAyffqb48CHRyVQcgWLJV/AZ27d+IBvG5HFklekDZJA95SWvc3WMAlemMxSKzkxHXa2AyvYNwaRINQfAG+4ZqF0AP68JIOoardVlXG6RjakQtnjvotjIgI7MqYBiuZjs3qHhHe+qfORT6iaQZg/xPGQ+la2LMZqVbpDa5pQjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763933214; c=relaxed/simple;
	bh=u5leo9D4ZtN9sgkCPa1rokCtd0TmHGoRYH0QrBvGWkU=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=rZATQ5o1k25EC7yzRFQr7+CB7f+sLF3zJXznURYfsDIMxMjM1eKGlqjHhlhEe36EieuLJlGiroUBnbcq8ctwxtpeCiS4rowpvVbFshj76j2D9joyfQdT4/qkspoG4l2U++4NRUzyOpGZuimRoJ1YD2wCpX4mZ9w/8mWPzrIUmcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=GR7QYVS/; arc=none smtp.client-ip=66.163.184.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763933211; bh=u5leo9D4ZtN9sgkCPa1rokCtd0TmHGoRYH0QrBvGWkU=; h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To; b=GR7QYVS/UvOwtmjmanC+RP8eamSlti8neo3dIkI66kz49f56UTk+2cNAa8N5Kxyxhsplqz4+gXqXNy4wpIPiHJz5uzK2WAI+K+LMzg1nQhEorW4cqoem/FaQtNRuhY4lgOGsMRx3rIu+tXyjznm4Lh5MwCeIjbrolNwQdIwlkXLrBMIUmDtghICdXGSTthh/LatKGpvKrOme77gjWAGKtWfm2Uluy0KIRPLGwpiXc32+4oQ6qtUaFFXkBY+9bqcnIv6H3crdN96LFGPOyiOf6jnMXQ9dwW/QOo0xxiAvmb1Rqv5nqSXl0dspXmqnxH0pzuy6w1axitcSq+w9WeS6fA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763933211; bh=TnKK/Q00T8bTRW4/jwh9IV6kuCpe6UKxdyDs6F8WhWW=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Z2RRyozvc/wDC2nTy6JPWqSOPdjmQlW2vGLSqbCD7Y0jiJyZjd8iLXJQgJKiuGEFhabpSCwCj1cMow6ftYTjjmDr7iSI8F7OypItNFtf5P+MylENtsaOzTg4uYw9frO+Jhf0bsPbQN8ofIKVmIIgNcf0lgNw+n65nS5rDkVkMsj3kBa5T6+etpjkooSYntfyzyWr2XGuHhJTCipYReH7Bc6YgdboyYXS+jGmpPmE6e9CSGQEx2hO6ViHyes3Wj2tUIzprEwUBwCipmKAYZRVTAu6VFXqNZQq3wQ/KnT8oqnB2jINZL5seI+bK3l4rBpsPWGf3oRlvX4fREXJDmCneA==
X-YMail-OSG: hL4yemwVM1mHD.pCpREYNREgFZA5GDBs4BFswCUeWycOaFhQtBhgY6iL0CCjd3A
 YMyX7xqwRSnQIvj94LXUpnGHmCMGMR1g05_QJfXy7idwx5DoXcyj8Pifrzme7yS1pjF_ywUUCNDZ
 gFUrLZ56FpFiSx1SVIIcvSKE4.OW_GYbzxtgUaoxutAY49rVhdp_oNW55g.6LFw3614JXyrIUlex
 yBLUaIuIUOJq4KLoCxFcvaCw7zzhsxhKC2VICyT_HCy50vHmFv5_m4gh61zOKykpgC7jRmNAnXuw
 Z6SUM6kXJGa2hqyMjIsHBQRM_9u6OJwN7nSe4HKv66QPAJ8yzfwI4wCNsx25yYs6STnePe8AIrr2
 HF.RuME.mAgtQGLejGyy7O_iG5IIw8tUXxQjedzZpj9hji1IXGYJrVQ5npCz6izimhnOKsU.S1Rz
 66w6yzwHdiGc9t7jtL7Z.Qj3NgYJa3YwUTYrS7.VbKiYeY._nXYpfgiM3mbwK7GVxsKrPWAKJszU
 nXMNpnz8U2m5ggRO.sWyBIhmKhgX5I5DjLGIgm4tdSBwIqaFRlvvv0GVpkKKSkG4_VguaRrvH33V
 hM3Ud8JSuQJb0SAYDVO3V.DdsLIPZXxz0P6Ps8oz4w7ABOWEQvNGnV37DDYp0WquL2yLjOytd5VS
 WNeF4_Mp19fF3snSwXGCHk6mcOKw.jX_o7oQUGYa3mqBnMmv6G73EZ8NhIxJ9NPilc.4yjV7jqp5
 9dWasFzAkQ4ybiyZGgCHQiSjwbtyCTDMe39XxElwFpU9NqqxeDyZswO1F6ulEr6voFZ3S8D4TSGS
 rsZDdmddeZ.N7DSpfam7Ah_N68Nde6IRKNA6p5Hq2EEdjAWWauQjuL9qXtjt9w1DTcjTG2z7NT._
 WbI9GjSAI0NrZZPvCooSJYbgR5xaXMjRnesnIB2eo8n1ICcF9fDSCLmB4jAiHOdhxJZHcL9mMkyi
 8MsQkxEXlSfJMOD9788KKFUulPN2Jgb4jDEP0lhSnYhVIe9D3QM7UZV6qCeJ.wuQqjvX4cPiJqWf
 jiVQKAxh0EOuLkSM.Z_UuXQnjZ6dcMGWoNp8Me.fEDmkH4M52k.0osFvXWyuYipak0JyXWYdboav
 MuU.6w.N9CdO_FgNKLWhBk9bNM8gjoSy6JtxuBnGv.uoo3wRM1UW70jCpiQk5LWY7dQDPyQScWgT
 2BQo1OQubJiucu7ry95KNh.PRGTieXxr_VKAys0Lu_pN6kJOg02vvIOWzZ8l6jPGcg29BpIGAK2s
 bb_XX8AJujnmjwPv2UU5GEtxff.P_yarZTm7G4NEfVYljrqAMl4r8IIoY2wtqo_UJzp_ABfIZue4
 sj4RxZYipNPYKfLO0Kf0xLS7qMY8u5NUJnfBPlftGt.TqGOTeSSF1xfwHWYpVtmr0YkmiWUFR6lV
 RaFzD_acm60SiqlTudZmr7KctmRxQJBz9_5kq3t7hDXSHY7YyqWxn4UDP7.DDa3lovvpIYhJ7oAO
 SBb57UE_zHhjoy5U8PocTNpUiQg56zKphp1axAb1i8uumDwB.Mi3L3dnduuihrbW0e8eSSl6e58.
 QLTRPUNXgUgf7qCWHHWiJnYD3ZwJ3s8DK.2bprc0FasS5gLhfE.ytnCKSDqM_mTImb28swpdmphd
 n408I0KozjEktJcVdMzdiP7HIcW93FIaCwUXlaMT33vjiCBWeP0AJOZjMQKeP3jOfK3zOC5tApsm
 E8QtgvLX4bs3pK33FMiYZK.IHF_wCtRJrJTRvifEra.qFxpaK73DK5qaDgDXIaQNeor9j8FSftc5
 kpScTE5e5y40GrWznjYp7FATlW37UR7beLABuNP0jvnjJ0Nz6b07pk9b2_JEYjPizDO0jhKeWQ9w
 63EcoTGGRP.EEZRXY4Jl0YYJc6jeuKr2TwKEM5CoQvYitvuF8yg3mlqnQbKx7KdXnIacZ0exx8XX
 W7cbP2gUYYESQd6h5YKvD8VcuTMpm3hlaJCU9YM1kgK6wzUDjZTuIpTh6HX91lAJLi8NTS5LxyYC
 DUOwZuJpulYglWDSDowz8GejPGZq42xgOq.duVA0PpnJuvLQaz0aI9YHiGY9DMuGOSNSkdkyIkpL
 _zaTqAGJ1kiS9PZe1Bn7d6iIkcOyTRgAwmigWtEXxSIIUjsxmFhmxaddHZzj0o11cfFRa5D_OagY
 WUetwqtbptAdG1JZBzVH0AHJ9zpVczJVpoFVjXIjZdKJkk0doCqxugilFKJfaQxD9eeFhPRM2bJC
 C9fQ6DP9Xo6pBRNyk00zk8fEM4B.19Bag59l1t7_eCDEbRGpnOg--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: a1e0ebbe-66ae-4333-a92e-034c6d732660
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Sun, 23 Nov 2025 21:26:51 +0000
Date: Sun, 23 Nov 2025 21:26:47 +0000 (UTC)
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, 
	"pavel@ucw.cz" <pavel@ucw.cz>, 
	"jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
Message-ID: <1348915776.459857.1763933207303@mail.yahoo.com>
Subject: [PATCH 1/2] leds: accept trigger parameters in "trigger:params"
 format
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1348915776.459857.1763933207303.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.24794 YMailNorrin

Allow parameters to be passed along with the trigger name when
writing to /sys/class/leds/<led>/trigger in the format:
=C2=A0=C2=A0echo "trigger_name:params" > /sys/class/leds/<led>/trigger

Core stores the RHS in led_cdev->params for the duration of the
activate() call; triggers may read and optionally consume or copy it.
Core frees any remaining buffer after activate() returns.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -33,6 +33,12 @@ trigger_relevant(struct led_classdev *le
=C2=A0 =C2=A0 =C2=A0return !trig->trigger_type || trig->trigger_type =3D=3D=
 led_cdev->trigger_type;
=C2=A0}
=C2=A0
+/*=C2=A0
+ * core: accept "<trigger>" or "<trigger>:<params>" and pass params via le=
d_cdev->params.
+ * - If a colon is present, the RHS is duplicated and stored in led_cdev->=
params.
+ * - The trigger's activate callback may consume the pointer (free it and =
set to NULL).
+ * - If the trigger does not consume it, core frees the buffer after activ=
ate returns.
+ */
=C2=A0ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bin_attribute=
 *bin_attr, char *buf,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loff_t pos, size_t c=
ount)
@@ -41,6 +47,10 @@ ssize_t led_trigger_write(struct file *f
=C2=A0 =C2=A0 =C2=A0struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
=C2=A0 =C2=A0 =C2=A0struct led_trigger *trig;
=C2=A0 =C2=A0 =C2=A0int ret =3D count;
+=C2=A0 =C2=A0 char *tmp =3D NULL;
+=C2=A0 =C2=A0 char *params =3D NULL;
+=C2=A0 =C2=A0 char *pcolon;
+=C2=A0 =C2=A0 bool found =3D false;
=C2=A0
=C2=A0 =C2=A0 =C2=A0mutex_lock(&led_cdev->led_access);
=C2=A0
@@ -49,26 +59,81 @@ ssize_t led_trigger_write(struct file *f
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unlock;
=C2=A0 =C2=A0 =C2=A0}
=C2=A0
-=C2=A0 =C2=A0 if (sysfs_streq(buf, "none")) {
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 led_trigger_remove(led_cdev);
+=C2=A0 =C2=A0 /* copy input and NUL-terminate; trim trailing newline if pr=
esent */
+=C2=A0 =C2=A0 tmp =3D kstrndup(buf, count, GFP_KERNEL);
+=C2=A0 =C2=A0 if (!tmp) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unlock;
=C2=A0 =C2=A0 =C2=A0}
+=C2=A0 =C2=A0 if (strlen(tmp) && tmp[strlen(tmp) - 1] =3D=3D '\n')
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp[strlen(tmp) - 1] =3D '\0';
+
+=C2=A0 =C2=A0 /* handle special keywords */
+=C2=A0 =C2=A0 if (sysfs_streq(tmp, "none")) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 led_trigger_remove(led_cdev);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_free;
+=C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 if (sysfs_streq(tmp, "default")) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 led_trigger_set_default(led_cdev);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_free;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* split on first ':' to accept "<trigger>" or "<trigger>:<p=
arams>" */
+=C2=A0 =C2=A0 pcolon =3D strchr(tmp, ':');
+=C2=A0 =C2=A0 if (pcolon) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pcolon =3D '\0';
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 params =3D kstrdup(pcolon + 1, GFP_KERNEL);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!params) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_free;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 }
=C2=A0
=C2=A0 =C2=A0 =C2=A0down_read(&triggers_list_lock);
=C2=A0 =C2=A0 =C2=A0list_for_each_entry(trig, &trigger_list, next_trig) {
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysfs_streq(buf, trig->name) && trigger_re=
levant(led_cdev, trig)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!trigger_relevant(led_cdev, trig))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysfs_streq(tmp, trig->name)) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0down_write(&led_cdev->trigg=
er_lock);
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* attach transient params to le=
d_cdev before setting trigger */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (params) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(led_cdev->pa=
rams);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led_cdev->params =
=3D params;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params =3D NULL; /=
* ownership transferred */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(led_cdev->pa=
rams);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led_cdev->params =
=3D NULL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* set the trigger (this will ca=
ll trig->activate/led_trigger_set) */
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led_trigger_set(led_cdev, t=
rig);
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0up_write(&led_cdev->trigger=
_lock);
=C2=A0
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 up_read(&triggers_list_lock);
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto unlock;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
=C2=A0 =C2=A0 =C2=A0}
-=C2=A0 =C2=A0 /* we come here only if buf matches no trigger */
-=C2=A0 =C2=A0 ret =3D -EINVAL;
=C2=A0 =C2=A0 =C2=A0up_read(&triggers_list_lock);
=C2=A0
+=C2=A0 =C2=A0 if (!found) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* no matching trigger name found */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_free;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* If the trigger didn't consume the transient params, free =
it now. */
+=C2=A0 =C2=A0 down_write(&led_cdev->trigger_lock);
+=C2=A0 =C2=A0 if (led_cdev->params) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(led_cdev->params);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 led_cdev->params =3D NULL;
+=C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 up_write(&led_cdev->trigger_lock);
+
+out_free:
+=C2=A0 =C2=A0 kfree(tmp);
+=C2=A0 =C2=A0 kfree(params); /* free if not attached */
=C2=A0unlock:
=C2=A0 =C2=A0 =C2=A0mutex_unlock(&led_cdev->led_access);
=C2=A0 =C2=A0 =C2=A0return ret;
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -240,6 +240,17 @@ struct led_classdev {
=C2=A0
=C2=A0 =C2=A0 =C2=A0/* Ensures consistent access to the LED class device */
=C2=A0 =C2=A0 =C2=A0struct mutex=C2=A0 =C2=A0 =C2=A0 =C2=A0 led_access;
+=C2=A0 =C2=A0 /*
+=C2=A0 =C2=A0 =C2=A0* Optional transient parameter provided by core when u=
ser writes
+=C2=A0 =C2=A0 =C2=A0* "<trigger_name>:<param>" to /sys/class/leds/<led>/tr=
igger.
+=C2=A0 =C2=A0 =C2=A0* - Core allocates a NUL-terminated string and stores =
it here before
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0calling trigger->activate(led_cdev).
+=C2=A0 =C2=A0 =C2=A0* - Trigger may "consume" the string by freeing it and=
 setting the
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0pointer to NULL.
+=C2=A0 =C2=A0 =C2=A0* - If the trigger does not consume it, core frees the=
 buffer after
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0activate returns.
+=C2=A0 =C2=A0 =C2=A0*/
+=C2=A0 =C2=A0 char *params;
=C2=A0};
=C2=A0
=C2=A0/**

