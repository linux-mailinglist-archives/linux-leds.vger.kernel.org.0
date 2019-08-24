Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 896DC9C0A0
	for <lists+linux-leds@lfdr.de>; Sun, 25 Aug 2019 00:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbfHXWDl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Aug 2019 18:03:41 -0400
Received: from mga04.intel.com ([192.55.52.120]:57030 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727868AbfHXWDl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 24 Aug 2019 18:03:41 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Aug 2019 15:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,426,1559545200"; 
   d="gz'50?scan'50,208,50";a="208927545"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2019 15:03:38 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1i1e8H-000Il4-PB; Sun, 25 Aug 2019 06:03:37 +0800
Date:   Sun, 25 Aug 2019 06:03:02 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     kbuild-all@01.org, linux-leds@vger.kernel.org
Subject: [j.anaszewski-leds:for-next 15/49]
 drivers/input/keyboard/applespi.c:1789: undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <201908250600.zVS5YXcp%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="f5lmhivugl4epj2u"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--f5lmhivugl4epj2u
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git for-next
head:   fd81d7e946c6bdb86dbf0bd88fee3e1a545e7979
commit: b2b998c0f944993c9ef435569651e407d607af41 [15/49] leds: class: Improve LED and LED flash class registration API
config: i386-randconfig-h002-201934 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-10) 7.4.0
reproduce:
        git checkout b2b998c0f944993c9ef435569651e407d607af41
        # save the attached .config to linux build tree
        make ARCH=i386 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/input/keyboard/applespi.o: in function `applespi_probe':
>> drivers/input/keyboard/applespi.c:1789: undefined reference to `devm_led_classdev_register_ext'

vim +1789 drivers/input/keyboard/applespi.c

038b1a05eae666 Ronald Tschalär 2019-07-15  1620  
038b1a05eae666 Ronald Tschalär 2019-07-15  1621  static int applespi_probe(struct spi_device *spi)
038b1a05eae666 Ronald Tschalär 2019-07-15  1622  {
038b1a05eae666 Ronald Tschalär 2019-07-15  1623  	struct applespi_data *applespi;
038b1a05eae666 Ronald Tschalär 2019-07-15  1624  	acpi_handle spi_handle = ACPI_HANDLE(&spi->dev);
038b1a05eae666 Ronald Tschalär 2019-07-15  1625  	acpi_status acpi_sts;
038b1a05eae666 Ronald Tschalär 2019-07-15  1626  	int sts, i;
038b1a05eae666 Ronald Tschalär 2019-07-15  1627  	unsigned long long gpe, usb_status;
038b1a05eae666 Ronald Tschalär 2019-07-15  1628  
038b1a05eae666 Ronald Tschalär 2019-07-15  1629  	/* check if the USB interface is present and enabled already */
038b1a05eae666 Ronald Tschalär 2019-07-15  1630  	acpi_sts = acpi_evaluate_integer(spi_handle, "UIST", NULL, &usb_status);
038b1a05eae666 Ronald Tschalär 2019-07-15  1631  	if (ACPI_SUCCESS(acpi_sts) && usb_status) {
038b1a05eae666 Ronald Tschalär 2019-07-15  1632  		/* let the USB driver take over instead */
038b1a05eae666 Ronald Tschalär 2019-07-15  1633  		dev_info(&spi->dev, "USB interface already enabled\n");
038b1a05eae666 Ronald Tschalär 2019-07-15  1634  		return -ENODEV;
038b1a05eae666 Ronald Tschalär 2019-07-15  1635  	}
038b1a05eae666 Ronald Tschalär 2019-07-15  1636  
038b1a05eae666 Ronald Tschalär 2019-07-15  1637  	/* allocate driver data */
038b1a05eae666 Ronald Tschalär 2019-07-15  1638  	applespi = devm_kzalloc(&spi->dev, sizeof(*applespi), GFP_KERNEL);
038b1a05eae666 Ronald Tschalär 2019-07-15  1639  	if (!applespi)
038b1a05eae666 Ronald Tschalär 2019-07-15  1640  		return -ENOMEM;
038b1a05eae666 Ronald Tschalär 2019-07-15  1641  
038b1a05eae666 Ronald Tschalär 2019-07-15  1642  	applespi->spi = spi;
038b1a05eae666 Ronald Tschalär 2019-07-15  1643  
038b1a05eae666 Ronald Tschalär 2019-07-15  1644  	INIT_WORK(&applespi->work, applespi_worker);
038b1a05eae666 Ronald Tschalär 2019-07-15  1645  
038b1a05eae666 Ronald Tschalär 2019-07-15  1646  	/* store the driver data */
038b1a05eae666 Ronald Tschalär 2019-07-15  1647  	spi_set_drvdata(spi, applespi);
038b1a05eae666 Ronald Tschalär 2019-07-15  1648  
038b1a05eae666 Ronald Tschalär 2019-07-15  1649  	/* create our buffers */
038b1a05eae666 Ronald Tschalär 2019-07-15  1650  	applespi->tx_buffer = devm_kmalloc(&spi->dev, APPLESPI_PACKET_SIZE,
038b1a05eae666 Ronald Tschalär 2019-07-15  1651  					   GFP_KERNEL);
038b1a05eae666 Ronald Tschalär 2019-07-15  1652  	applespi->tx_status = devm_kmalloc(&spi->dev, APPLESPI_STATUS_SIZE,
038b1a05eae666 Ronald Tschalär 2019-07-15  1653  					   GFP_KERNEL);
038b1a05eae666 Ronald Tschalär 2019-07-15  1654  	applespi->rx_buffer = devm_kmalloc(&spi->dev, APPLESPI_PACKET_SIZE,
038b1a05eae666 Ronald Tschalär 2019-07-15  1655  					   GFP_KERNEL);
038b1a05eae666 Ronald Tschalär 2019-07-15  1656  	applespi->msg_buf = devm_kmalloc_array(&spi->dev, MAX_PKTS_PER_MSG,
038b1a05eae666 Ronald Tschalär 2019-07-15  1657  					       APPLESPI_PACKET_SIZE,
038b1a05eae666 Ronald Tschalär 2019-07-15  1658  					       GFP_KERNEL);
038b1a05eae666 Ronald Tschalär 2019-07-15  1659  
038b1a05eae666 Ronald Tschalär 2019-07-15  1660  	if (!applespi->tx_buffer || !applespi->tx_status ||
038b1a05eae666 Ronald Tschalär 2019-07-15  1661  	    !applespi->rx_buffer || !applespi->msg_buf)
038b1a05eae666 Ronald Tschalär 2019-07-15  1662  		return -ENOMEM;
038b1a05eae666 Ronald Tschalär 2019-07-15  1663  
038b1a05eae666 Ronald Tschalär 2019-07-15  1664  	/* set up our spi messages */
038b1a05eae666 Ronald Tschalär 2019-07-15  1665  	applespi_setup_read_txfrs(applespi);
038b1a05eae666 Ronald Tschalär 2019-07-15  1666  	applespi_setup_write_txfrs(applespi);
038b1a05eae666 Ronald Tschalär 2019-07-15  1667  
038b1a05eae666 Ronald Tschalär 2019-07-15  1668  	/* cache ACPI method handles */
038b1a05eae666 Ronald Tschalär 2019-07-15  1669  	acpi_sts = acpi_get_handle(spi_handle, "SIEN", &applespi->sien);
038b1a05eae666 Ronald Tschalär 2019-07-15  1670  	if (ACPI_FAILURE(acpi_sts)) {
038b1a05eae666 Ronald Tschalär 2019-07-15  1671  		dev_err(&applespi->spi->dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1672  			"Failed to get SIEN ACPI method handle: %s\n",
038b1a05eae666 Ronald Tschalär 2019-07-15  1673  			acpi_format_exception(acpi_sts));
038b1a05eae666 Ronald Tschalär 2019-07-15  1674  		return -ENODEV;
038b1a05eae666 Ronald Tschalär 2019-07-15  1675  	}
038b1a05eae666 Ronald Tschalär 2019-07-15  1676  
038b1a05eae666 Ronald Tschalär 2019-07-15  1677  	acpi_sts = acpi_get_handle(spi_handle, "SIST", &applespi->sist);
038b1a05eae666 Ronald Tschalär 2019-07-15  1678  	if (ACPI_FAILURE(acpi_sts)) {
038b1a05eae666 Ronald Tschalär 2019-07-15  1679  		dev_err(&applespi->spi->dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1680  			"Failed to get SIST ACPI method handle: %s\n",
038b1a05eae666 Ronald Tschalär 2019-07-15  1681  			acpi_format_exception(acpi_sts));
038b1a05eae666 Ronald Tschalär 2019-07-15  1682  		return -ENODEV;
038b1a05eae666 Ronald Tschalär 2019-07-15  1683  	}
038b1a05eae666 Ronald Tschalär 2019-07-15  1684  
038b1a05eae666 Ronald Tschalär 2019-07-15  1685  	/* switch on the SPI interface */
038b1a05eae666 Ronald Tschalär 2019-07-15  1686  	sts = applespi_setup_spi(applespi);
038b1a05eae666 Ronald Tschalär 2019-07-15  1687  	if (sts)
038b1a05eae666 Ronald Tschalär 2019-07-15  1688  		return sts;
038b1a05eae666 Ronald Tschalär 2019-07-15  1689  
038b1a05eae666 Ronald Tschalär 2019-07-15  1690  	sts = applespi_enable_spi(applespi);
038b1a05eae666 Ronald Tschalär 2019-07-15  1691  	if (sts)
038b1a05eae666 Ronald Tschalär 2019-07-15  1692  		return sts;
038b1a05eae666 Ronald Tschalär 2019-07-15  1693  
038b1a05eae666 Ronald Tschalär 2019-07-15  1694  	/* setup the keyboard input dev */
038b1a05eae666 Ronald Tschalär 2019-07-15  1695  	applespi->keyboard_input_dev = devm_input_allocate_device(&spi->dev);
038b1a05eae666 Ronald Tschalär 2019-07-15  1696  
038b1a05eae666 Ronald Tschalär 2019-07-15  1697  	if (!applespi->keyboard_input_dev)
038b1a05eae666 Ronald Tschalär 2019-07-15  1698  		return -ENOMEM;
038b1a05eae666 Ronald Tschalär 2019-07-15  1699  
038b1a05eae666 Ronald Tschalär 2019-07-15  1700  	applespi->keyboard_input_dev->name = "Apple SPI Keyboard";
038b1a05eae666 Ronald Tschalär 2019-07-15  1701  	applespi->keyboard_input_dev->phys = "applespi/input0";
038b1a05eae666 Ronald Tschalär 2019-07-15  1702  	applespi->keyboard_input_dev->dev.parent = &spi->dev;
038b1a05eae666 Ronald Tschalär 2019-07-15  1703  	applespi->keyboard_input_dev->id.bustype = BUS_SPI;
038b1a05eae666 Ronald Tschalär 2019-07-15  1704  
038b1a05eae666 Ronald Tschalär 2019-07-15  1705  	applespi->keyboard_input_dev->evbit[0] =
038b1a05eae666 Ronald Tschalär 2019-07-15  1706  			BIT_MASK(EV_KEY) | BIT_MASK(EV_LED) | BIT_MASK(EV_REP);
038b1a05eae666 Ronald Tschalär 2019-07-15  1707  	applespi->keyboard_input_dev->ledbit[0] = BIT_MASK(LED_CAPSL);
038b1a05eae666 Ronald Tschalär 2019-07-15  1708  
038b1a05eae666 Ronald Tschalär 2019-07-15  1709  	input_set_drvdata(applespi->keyboard_input_dev, applespi);
038b1a05eae666 Ronald Tschalär 2019-07-15  1710  	applespi->keyboard_input_dev->event = applespi_event;
038b1a05eae666 Ronald Tschalär 2019-07-15  1711  
038b1a05eae666 Ronald Tschalär 2019-07-15  1712  	for (i = 0; i < ARRAY_SIZE(applespi_scancodes); i++)
038b1a05eae666 Ronald Tschalär 2019-07-15  1713  		if (applespi_scancodes[i])
038b1a05eae666 Ronald Tschalär 2019-07-15  1714  			input_set_capability(applespi->keyboard_input_dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1715  					     EV_KEY, applespi_scancodes[i]);
038b1a05eae666 Ronald Tschalär 2019-07-15  1716  
038b1a05eae666 Ronald Tschalär 2019-07-15  1717  	for (i = 0; i < ARRAY_SIZE(applespi_controlcodes); i++)
038b1a05eae666 Ronald Tschalär 2019-07-15  1718  		if (applespi_controlcodes[i])
038b1a05eae666 Ronald Tschalär 2019-07-15  1719  			input_set_capability(applespi->keyboard_input_dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1720  					     EV_KEY, applespi_controlcodes[i]);
038b1a05eae666 Ronald Tschalär 2019-07-15  1721  
038b1a05eae666 Ronald Tschalär 2019-07-15  1722  	for (i = 0; i < ARRAY_SIZE(applespi_fn_codes); i++)
038b1a05eae666 Ronald Tschalär 2019-07-15  1723  		if (applespi_fn_codes[i].to)
038b1a05eae666 Ronald Tschalär 2019-07-15  1724  			input_set_capability(applespi->keyboard_input_dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1725  					     EV_KEY, applespi_fn_codes[i].to);
038b1a05eae666 Ronald Tschalär 2019-07-15  1726  
038b1a05eae666 Ronald Tschalär 2019-07-15  1727  	input_set_capability(applespi->keyboard_input_dev, EV_KEY, KEY_FN);
038b1a05eae666 Ronald Tschalär 2019-07-15  1728  
038b1a05eae666 Ronald Tschalär 2019-07-15  1729  	sts = input_register_device(applespi->keyboard_input_dev);
038b1a05eae666 Ronald Tschalär 2019-07-15  1730  	if (sts) {
038b1a05eae666 Ronald Tschalär 2019-07-15  1731  		dev_err(&applespi->spi->dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1732  			"Unable to register keyboard input device (%d)\n", sts);
038b1a05eae666 Ronald Tschalär 2019-07-15  1733  		return -ENODEV;
038b1a05eae666 Ronald Tschalär 2019-07-15  1734  	}
038b1a05eae666 Ronald Tschalär 2019-07-15  1735  
038b1a05eae666 Ronald Tschalär 2019-07-15  1736  	/*
038b1a05eae666 Ronald Tschalär 2019-07-15  1737  	 * The applespi device doesn't send interrupts normally (as is described
038b1a05eae666 Ronald Tschalär 2019-07-15  1738  	 * in its DSDT), but rather seems to use ACPI GPEs.
038b1a05eae666 Ronald Tschalär 2019-07-15  1739  	 */
038b1a05eae666 Ronald Tschalär 2019-07-15  1740  	acpi_sts = acpi_evaluate_integer(spi_handle, "_GPE", NULL, &gpe);
038b1a05eae666 Ronald Tschalär 2019-07-15  1741  	if (ACPI_FAILURE(acpi_sts)) {
038b1a05eae666 Ronald Tschalär 2019-07-15  1742  		dev_err(&applespi->spi->dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1743  			"Failed to obtain GPE for SPI slave device: %s\n",
038b1a05eae666 Ronald Tschalär 2019-07-15  1744  			acpi_format_exception(acpi_sts));
038b1a05eae666 Ronald Tschalär 2019-07-15  1745  		return -ENODEV;
038b1a05eae666 Ronald Tschalär 2019-07-15  1746  	}
038b1a05eae666 Ronald Tschalär 2019-07-15  1747  	applespi->gpe = (int)gpe;
038b1a05eae666 Ronald Tschalär 2019-07-15  1748  
038b1a05eae666 Ronald Tschalär 2019-07-15  1749  	acpi_sts = acpi_install_gpe_handler(NULL, applespi->gpe,
038b1a05eae666 Ronald Tschalär 2019-07-15  1750  					    ACPI_GPE_LEVEL_TRIGGERED,
038b1a05eae666 Ronald Tschalär 2019-07-15  1751  					    applespi_notify, applespi);
038b1a05eae666 Ronald Tschalär 2019-07-15  1752  	if (ACPI_FAILURE(acpi_sts)) {
038b1a05eae666 Ronald Tschalär 2019-07-15  1753  		dev_err(&applespi->spi->dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1754  			"Failed to install GPE handler for GPE %d: %s\n",
038b1a05eae666 Ronald Tschalär 2019-07-15  1755  			applespi->gpe, acpi_format_exception(acpi_sts));
038b1a05eae666 Ronald Tschalär 2019-07-15  1756  		return -ENODEV;
038b1a05eae666 Ronald Tschalär 2019-07-15  1757  	}
038b1a05eae666 Ronald Tschalär 2019-07-15  1758  
038b1a05eae666 Ronald Tschalär 2019-07-15  1759  	applespi->suspended = false;
038b1a05eae666 Ronald Tschalär 2019-07-15  1760  
038b1a05eae666 Ronald Tschalär 2019-07-15  1761  	acpi_sts = acpi_enable_gpe(NULL, applespi->gpe);
038b1a05eae666 Ronald Tschalär 2019-07-15  1762  	if (ACPI_FAILURE(acpi_sts)) {
038b1a05eae666 Ronald Tschalär 2019-07-15  1763  		dev_err(&applespi->spi->dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1764  			"Failed to enable GPE handler for GPE %d: %s\n",
038b1a05eae666 Ronald Tschalär 2019-07-15  1765  			applespi->gpe, acpi_format_exception(acpi_sts));
038b1a05eae666 Ronald Tschalär 2019-07-15  1766  		acpi_remove_gpe_handler(NULL, applespi->gpe, applespi_notify);
038b1a05eae666 Ronald Tschalär 2019-07-15  1767  		return -ENODEV;
038b1a05eae666 Ronald Tschalär 2019-07-15  1768  	}
038b1a05eae666 Ronald Tschalär 2019-07-15  1769  
038b1a05eae666 Ronald Tschalär 2019-07-15  1770  	/* trigger touchpad setup */
038b1a05eae666 Ronald Tschalär 2019-07-15  1771  	applespi_init(applespi, false);
038b1a05eae666 Ronald Tschalär 2019-07-15  1772  
038b1a05eae666 Ronald Tschalär 2019-07-15  1773  	/*
038b1a05eae666 Ronald Tschalär 2019-07-15  1774  	 * By default this device is not enabled for wakeup; but USB keyboards
038b1a05eae666 Ronald Tschalär 2019-07-15  1775  	 * generally are, so the expectation is that by default the keyboard
038b1a05eae666 Ronald Tschalär 2019-07-15  1776  	 * will wake the system.
038b1a05eae666 Ronald Tschalär 2019-07-15  1777  	 */
038b1a05eae666 Ronald Tschalär 2019-07-15  1778  	device_wakeup_enable(&spi->dev);
038b1a05eae666 Ronald Tschalär 2019-07-15  1779  
038b1a05eae666 Ronald Tschalär 2019-07-15  1780  	/* set up keyboard-backlight */
038b1a05eae666 Ronald Tschalär 2019-07-15  1781  	sts = applespi_get_saved_bl_level(applespi);
038b1a05eae666 Ronald Tschalär 2019-07-15  1782  	if (sts >= 0)
038b1a05eae666 Ronald Tschalär 2019-07-15  1783  		applespi_set_bl_level(&applespi->backlight_info, sts);
038b1a05eae666 Ronald Tschalär 2019-07-15  1784  
038b1a05eae666 Ronald Tschalär 2019-07-15  1785  	applespi->backlight_info.name            = "spi::kbd_backlight";
038b1a05eae666 Ronald Tschalär 2019-07-15  1786  	applespi->backlight_info.default_trigger = "kbd-backlight";
038b1a05eae666 Ronald Tschalär 2019-07-15  1787  	applespi->backlight_info.brightness_set  = applespi_set_bl_level;
038b1a05eae666 Ronald Tschalär 2019-07-15  1788  
038b1a05eae666 Ronald Tschalär 2019-07-15 @1789  	sts = devm_led_classdev_register(&spi->dev, &applespi->backlight_info);
038b1a05eae666 Ronald Tschalär 2019-07-15  1790  	if (sts)
038b1a05eae666 Ronald Tschalär 2019-07-15  1791  		dev_warn(&applespi->spi->dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1792  			 "Unable to register keyboard backlight class dev (%d)\n",
038b1a05eae666 Ronald Tschalär 2019-07-15  1793  			 sts);
038b1a05eae666 Ronald Tschalär 2019-07-15  1794  
038b1a05eae666 Ronald Tschalär 2019-07-15  1795  	/* set up debugfs entries for touchpad dimensions logging */
038b1a05eae666 Ronald Tschalär 2019-07-15  1796  	applespi->debugfs_root = debugfs_create_dir("applespi", NULL);
038b1a05eae666 Ronald Tschalär 2019-07-15  1797  	if (IS_ERR(applespi->debugfs_root)) {
038b1a05eae666 Ronald Tschalär 2019-07-15  1798  		if (PTR_ERR(applespi->debugfs_root) != -ENODEV)
038b1a05eae666 Ronald Tschalär 2019-07-15  1799  			dev_warn(&applespi->spi->dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1800  				 "Error creating debugfs root entry (%ld)\n",
038b1a05eae666 Ronald Tschalär 2019-07-15  1801  				 PTR_ERR(applespi->debugfs_root));
038b1a05eae666 Ronald Tschalär 2019-07-15  1802  	} else {
038b1a05eae666 Ronald Tschalär 2019-07-15  1803  		struct dentry *ret;
038b1a05eae666 Ronald Tschalär 2019-07-15  1804  
038b1a05eae666 Ronald Tschalär 2019-07-15  1805  		ret = debugfs_create_bool("enable_tp_dim", 0600,
038b1a05eae666 Ronald Tschalär 2019-07-15  1806  					  applespi->debugfs_root,
038b1a05eae666 Ronald Tschalär 2019-07-15  1807  					  &applespi->debug_tp_dim);
038b1a05eae666 Ronald Tschalär 2019-07-15  1808  		if (IS_ERR(ret))
038b1a05eae666 Ronald Tschalär 2019-07-15  1809  			dev_dbg(&applespi->spi->dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1810  				"Error creating debugfs entry enable_tp_dim (%ld)\n",
038b1a05eae666 Ronald Tschalär 2019-07-15  1811  				PTR_ERR(ret));
038b1a05eae666 Ronald Tschalär 2019-07-15  1812  
038b1a05eae666 Ronald Tschalär 2019-07-15  1813  		ret = debugfs_create_file("tp_dim", 0400,
038b1a05eae666 Ronald Tschalär 2019-07-15  1814  					  applespi->debugfs_root, applespi,
038b1a05eae666 Ronald Tschalär 2019-07-15  1815  					  &applespi_tp_dim_fops);
038b1a05eae666 Ronald Tschalär 2019-07-15  1816  		if (IS_ERR(ret))
038b1a05eae666 Ronald Tschalär 2019-07-15  1817  			dev_dbg(&applespi->spi->dev,
038b1a05eae666 Ronald Tschalär 2019-07-15  1818  				"Error creating debugfs entry tp_dim (%ld)\n",
038b1a05eae666 Ronald Tschalär 2019-07-15  1819  				PTR_ERR(ret));
038b1a05eae666 Ronald Tschalär 2019-07-15  1820  	}
038b1a05eae666 Ronald Tschalär 2019-07-15  1821  
038b1a05eae666 Ronald Tschalär 2019-07-15  1822  	return 0;
038b1a05eae666 Ronald Tschalär 2019-07-15  1823  }
038b1a05eae666 Ronald Tschalär 2019-07-15  1824  

:::::: The code at line 1789 was first introduced by commit
:::::: 038b1a05eae6666b731920e46f47d8e2332e07ff Input: add Apple SPI keyboard and trackpad driver

:::::: TO: Ronald Tschalär <ronald@innovation.ch>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--f5lmhivugl4epj2u
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
wDK0+VoF+7LVg65niNLT/x98kTAhqLgBAA==

--f5lmhivugl4epj2u--
